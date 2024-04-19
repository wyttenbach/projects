# dev or dev2d
export ADD_PROFILE=${ADD_PROFILE:=dev}
export TEST_PROFILES=test,$ADD_PROFILE
export SPRING_LOG=$SRC/spring.out
export SPRING_PORT=8443
export VH=${VH:=/c/dev/vagrant-boxes/OracleDatabase/19.3.0}

function get-all {
    prov-co provider-master-data-api
    install-config
}

function install-config {
    cp $PH/config/*.yml $SRC/provider-master-data-api/api/src/main/resources/
}

function diff-config {
    for i in dev dev2d uat; do
        diff $SRC/provider-master-data-api/api/src/main/resources/application-$i.yml $PH/config/application-$i.yml
    done
}

function update-config {
    for i in dev dev2d uat; do
        cp $SRC/provider-master-data-api/api/src/main/resources/application-$i.yml $PH/config/
    done
}

function deploy {
    deploy-build
}

function deploy-build {
    echo "Nothing to deploy"
}

function lsd {
    file=$(cd $SRC/provider-master-data-api; pathname $(recent | tail -1 | awk '{ print $3 }'))
    ls -ltr $SRC/provider-master-data-api/api/target/*-SNAPSHOT.jar "$file" $SRC/*.out $SRC/provider-master-data-api/creation_scripts/SQL/TEST/build.sql
}

function check-vagrant {
    echo -n "Checking vagrant...";
    telnet localhost 1521
}

function check-ds {
    echo -n "Checking datasource...";
    telnet va33dx13v1-scan1.wellpoint.com 1525
}

function check-version {
    cd $SRC/provider-master-data-api;
    echo -n "Checking version...";
    p1=$(mvn-project-version);
    p2=$(perl -n -e 'if (/^VERSION=(.*)/) { printf "$1\n"; }' api/scripts/include.sh)
    if [ "$p1" == "$p2" ]; then
        echo OK
        return 0
    else
        echo MISMATCH
        return 1
    fi
}

function unit {
    if [ $# -eq 0 ]; then
        check-vagrant || die "Vagrant not listening"
    fi
    local out=$SRC/unit.out;
    roll "$out";
    $PH/bin/unit.sh 2>&1 | tee "$out"
}

function unit-check {
    local out=$SRC/unit.out;
    grep "Tests run" $out | grep -v "Failures: 0, Errors: 0"
}

function jee-start {
    check-ds || die
#    check-version || die
    roll $SPRING_LOG
    (cd $SRC/provider-master-data-api;
     echo "TEST_PROFILES=$TEST_PROFILES"
    PROFILES=$TEST_PROFILES VERSION=$(mvn-project-version) $SRC/provider-master-data-api/api/scripts/run.sh 2>&1 | tee $SPRING_LOG)
}

function check-jee {
    local port=${SPRING_PORT:=8443}
    telnet localhost $port
}

function check-log {
    plist com.anthem.specialty.provider.api.Bootstrap > /dev/null
    if [ $? != 0 ]; then
        echo "Running in IDE"
        return
    fi
    check $SPRING_LOG
}

function verify {
    if [ $# -eq 0 ]; then
        check-jee || die "Not listening"
        check-log || die "Errors in the log"
    fi
    local out=$SRC/verify.out;
    roll "$out";
    go-get && $PH/bin/verify.sh 2>&1 | tee "$out"
}

function force-verify
{
    verify 1
}

function go { 
    swagger
}

function swagger { 
    
    local host="localhost";
    local dev="$DPDD"
    local uat="$DPDU"
    local sup="$DPDS"
    
    if [ $# -gt 0 ]; then
        # Indirect reference.
        eval host=\$$1;
        shift;
    fi;
    local port=${SPRING_PORT:=8443}
    local url=https://$host:$port/swagger-ui/index.html

    echo $url
    ff $url
    echo user/passw0rd
}

function go-get
{
    host=localhost
    if [ $# -gt 0 ]; then
        host=$(lookup $1)
        shift
    fi
    uri="/api/metadata/dataOwners"
    if [ $# -gt 0 ]; then
        uri="$1"
        shift
    fi
    dir=/tmp/go-get
    mkdir -p $dir
    file="$dir/response-${host}-${ADD_PROFILE}.json"
    url=$(printf "https://%s:8443%s" $host $uri)
    roll $file
    do_echo curl -f -u user:passw0rd -w "@$HOME/bin/curl-format.txt" -k -X GET $url -H "accept: */*" -H "DB-User: user3" -o $file && ls -l $file*
}

function pw {
    if [ "$(uname)" == "Darwin" ]; then
        plist spring.profiles.active=test,
    else
        getProcess.sh $SPRING_PORT
    fi
}

function sw {
    if [ "$(uname)" == "Darwin" ]; then
        slay spring.profiles.active=test, "$@"
    else
        jee-stop
    fi
}

function jee-stop {
    if [ "$(uname)" == "Darwin" ]; then
        sw
    else
        pid=$(getProcess.sh $SPRING_PORT | tail -3 | head -1 | awk '{ print $6 }')
        cmd="taskkill //f //pid $pid"
        echo $cmd
        $cmd
    fi
}

function build-scripts {
    local dir=$SRC/provider-master-data-api/creation_scripts 
    (cd $dir && ./rebuildAll.cmd)
}

# Does not work due to 'CONNECT SYS/oracle AS SYSDBA'
function run-scripts
{
    (cd $SRC;
    sqlplus -S  system/oracle@localhost:1521/orcl <<EOF
set echo off
set term off
set timing off
set heading off
set feedback off
set verify off
set linesize 32767
set pagesize 0

SPOOL vagrant.log

@$P/provider/sql/vagrant.sql;

spool off
exit
EOF
)
}

function revert-scripts {
    local dir=$SRC/provider-master-data-api/creation_scripts/SQL
    (cd $dir && git checkout HEAD .)
}

function version {
    local dir=$SRC/provider-master-data-api/
    (cd $dir &&
         version=$(mvn-project-version) &&
         version=${version%%-SNAPSHOT} &&
         echo $version)
}

function create-scripts {
    local dir=$SRC/provider-master-data-api/db
    local version=$(version)
    if [ $# -gt 0 ]; then
        version="$1"
    fi
    (cd $dir &&
    powershell -ExecutionPolicy ByPass -File create-deploy-script.ps1 $version &&
    powershell -ExecutionPolicy ByPass -File create-rollback-script.ps1 $version)
}
