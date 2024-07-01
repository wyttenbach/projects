export VSF_HOST=${VSF_HOST:=localhost}
export VSF_PORT=${VSF_PORT:=8080}
export VSF_SOCKET=$VSF_HOST:$VSF_PORT
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
    exe $CURL http://$VSF_SOCKET/sba/health
}

function swagger
{
    exe $BROWSER http://$VSF_SOCKET/
}

function hello
{
    exe $CURL http://$VSF_SOCKET/vaprofilesplunkforwarder/v1/
}

function another
{
    exe $CURL --json @splunk.json http://$VSF_SOCKET/vaprofilesplunkforwarder/v1/another
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