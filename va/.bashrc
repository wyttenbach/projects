export VSF_HOST=${VSF_HOST:=localhost}
export VSF_HOME=$SRC/vaprofile-splunk-forwarder/vaprofile-splunk-forwarder-server
export VSF_VER=1.0.0-SNAPSHOT
export VSF_JAR=$VSF_HOME/target/*-$VSF_VER.jar
export VSF_LOG=$VSF_HOME/vsf.log
export CURL=${CURL:=curl -s}

function vsf
{
    roll $VSF_LOG &&
    ls -l $VSF_JAR &&
    (cd $VSF_HOME; java -jar $VSF_JAR 2>&1 | tee $VSF_LOG) &
}

function health
{
    exe $CURL http://$VSF_HOST:8080/sba/health
}

function swagger
{
    exe $BROWSER http://$VSF_HOST:8080/
}

function hello
{
    exe $CURL http://$VSF_HOST:8080/vaprofilesplunkforwarder/v1/
}

function another
{
    exe $CURL http://$VSF_HOST:8080/another/v1/ -d name="Dale Wyttenbach" -d title=Wizard
}

function json
{
    exe $CURL --json '{"name":"Dale Wyttenbach","title":"Mr."}' \
        http://$VSF_HOST:8080/another/v1/
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