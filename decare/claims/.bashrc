#!/bin/bash
export CLAIMS_ENV=${CLAIMS_ENV:=services}
if [ -f "$PROJECT_HOME/.bashrc-$CLAIMS_ENV" ]; then
    . $PROJECT_HOME/.bashrc-$CLAIMS_ENV
fi

function gwt-login
{
    local host="localhost"
    if [ $# -gt 0 ]; then
        host="$(lookup $1)"
        shift
    fi

    local username=""
    if [ $# -gt 0 ]; then
        username="?devUserName=$1"
        shift
    fi

    dds-common $host 7788 claimsweb/loginPage$username
}

function gwt-mb
{
    echo "Get the current IP address, and add it to compatibility view"
    gwt-login $MB
}

function check-security {
    echo -n "Checking security..."
    hostport=$(perl -n -e 'if (/^claimsweb.security.java.naming.provider.url=t3:\/\/([a-z0-9\.]*):([0-9]*)/) { printf "%s %d", $1, $2; }' $WL_APP_PROPERTIES)
    telnet $hostport
}

function build-all
{
    (cd $SRC/claim-api-parent && build "$@") &&
        (cd $SRC/claim-domain-parent && build "$@") && 
        (cd $SRC/claim-web-parent && build "$@") &&
        (cd $SRC/claim-test && mvn compile $eclipse "$@")
}

function verify-all
{ 
    echo -n "Checking version..."
#    p1=$(cd $SRC/claim-test; mvn-project-property claim.web.version)
    p1=$(cd $SRC/claim-test; mvn-parent-version)
    p2=$(cd $SRC/claim-web-parent; mvn-project-version)
    if [ "$p1" != "$p2" ]; then
        echo "claim-test ($p1) does not match claim-web-parent ($p2)"
        return -1
    fi
    echo $p1
    return 0
}

function check-version {
    cd $SRC/claim-test; 
    echo -n "Checking deployed version..."
    p1=$(mvn-parent-version)
    local ear="$JEE_DEPLOY/claimservicesapp-$p1.ear"
    if [ ! -f "$ear" ]; then
        echo "$ear not found in autodeploy"
        return -1
    fi
    echo $p1
    return 0
}

function check-datasource {
    echo -n "Checking datasource..."
    local props=$SRC/claim-test/src/main/resources/local.properties
    if [ ! -f "$props" ]; then
        echo local.properties does not exist
        return -1
    fi
    grep ^nosave $props > /dev/null
    if [ $? == 0 ]; then
        echo "ok (nosave)"
        return 0
    fi
    db1=$(perl -n -e 'if (/^database=([\w]*)/) { printf "%s\n", lc $1 }' $props)
    container=$(perl -n -e 'if (/^container=([\w]*)/) { printf "%s\n", lc $1 }' $props)
    if [ $container == "oc4j" ]; then
        db2=$(ds)
        if [ "$db1" != "$db2" ]; then
            echo "oc4j datasource $db2 does not match claim-test $db1"
            return -1
        fi
    else
        db2=$(wlds)
        if [ "${db1}" != "${db2}" ]; then
            echo "WL datasource $db2 does not match claim-test $db1"
            return -1
        fi
    fi
    echo "ok"
    return 0
}

function deploy-services
{
    local src=$SRC/claim-web-parent/claimservices-parent
    local ear=$(cygpath -m $src/*/*/*.ear)
    if [ ! -f "$ear" ]; then
        echo "$src" does not contain an ear
        return
    fi
    undeploy
    deploy "$ear"
}

function freshen-services
{
    [ "$CLAIMS_ENV" == "services" ] || die "Services not deployed"
    local src=$SRC/claim-web-parent
    grep "claim.impl.version.*SNAPSHOT" $src/pom.xml || die "claim.impl.version is not a snapshot. Remember to clean!"
    [ -f pom.xml ] && mvn install && (cd $src/claimservices-parent; time build) && deploy-services
}

function deploy-web
{
    local src=$SRC/claim-web-parent/claimsweb
    local ear=$(cygpath -m $src/*/*/*.ear)
    if [ ! -f "$ear" ]; then
        echo "$src" does not contain an ear
        return
    fi
    undeploy
    deploy "$ear"
}

function freshen-web
{
    [ "$CLAIMS_ENV" == "web" ] || die "Web not deployed"
    local src=$SRC/claim-web-parent
    grep "claim.impl.version.*SNAPSHOT" $src/pom.xml || die "claim.impl.version is not a snapshot. Remember to clean!"
    [ -f pom.xml ] && mvn install && (cd $src/claimsweb; time build) && deploy-web
}

function switch-workspace
{
    local workspace=$1
    local branch=$2
    (cd $PROJECT_HOME;
        if [ ! -d $workspace ]; then
            echo "$workspace does not exist!"
            return
        fi
        junction src $workspace && cd src && get-all $branch)
}

function get-all
{
    claims-co claim-api-parent "$@" &&
        claims-co claim-domain-parent "$@" &&
        claims-co claim-web-parent "$@" &&
        claims-co claim-test "$@" &&
        touch strict && touch skip &&
        cp ~/src/java/jdbc/secret.properties claim-domain-parent
}

function clean-all
{
    (cd $SRC/claim-api-parent && clean) &&
    (cd $SRC/claim-domain-parent && clean) &&
    (cd $SRC/claim-web-parent && clean) &&
    (cd $SRC/claim-test && clean)
}

function update-all
{
    date
    (cd $SRC/claim-api-parent && gitupdate) &&
    (cd $SRC/claim-domain-parent && gitupdate) &&
    (cd $SRC/claim-web-parent && gitupdate) &&
    (cd $SRC/claim-test && gitupdate)
    if [ $? == 0 ]; then
        (cd $SRC; dotags) &
    else
        echo "update-all failed"
        return 1
    fi
}


function pre-update
{
    check-datasource || die
}
