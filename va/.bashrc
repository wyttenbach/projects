export VSF_HOST=${VSF_HOST:=localhost}

function vsf
{
    (cd $SRC/vaprofile-splunk-forwarder; ./run.sh) &
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