export VSF_HOST=${VSF_HOST:=localhost}
export VSF_HOME=$SRC/vaprofile-splunk-forwarder/vaprofile-splunk-forwarder-server
export VSF_VER=1.0.0-SNAPSHOT
export VSF_JAR=$VSF_HOME/target/*-$VSF_VER.jar
export VSF_LOG=$VSF_HOME/vsf.log

function vsf
{
    ls -l $VSF_JAR &&
    (cd $VSF_HOME; java -jar $VSF_JAR 2>&1 | tee $VSF_LOG) &
}

function up
{
    curl http://$VSF_HOST:8080/sba/health
}

function swagger
{
    browse http://$VSF_HOST:8080/
}

function hello
{
    curl http://$VSF_HOST:8080/vaprofilesplunkforwarder/v1/
}

function refresh { 
    pre-refresh;
    local out=$SRC/refresh.out;
    roll $out;
    /bin/rm -rf $HOME/VULS
    . $SRC/secret.txt
    ( update-all && rebuild-all ) 2>&1 | tee $out
}

function deploy-build {
    echo "Nothing to deploy (yet)"
}

function verify {
    $SRC/vulnerability-batch/chart.sh
}