#!/bin/bash

echo "================================================================"
echo "NOTE: JAVA_HOME=$JAVA_HOME will be used by the domain"
echo "================================================================"

domain=$(basename $WL_DOMAIN)
if [ $# -gt 0 ]; then
    domain=$1
    shift
fi
database=opsdd
if [ $# -gt 0 ]; then
    database=$1
    shift
fi
os=windows
if [ ! -d c:/windows ]; then
    os=linux
fi
echo $domain $database $os
do_cmd wlmvn com.oracle.weblogic:wls-maven-plugin:wlst -Dweblogic.os=$os -Dteam=dds -Drun=remove-domains -DlistDomains=$domain
do_cmd wlmvn com.oracle.weblogic:wls-maven-plugin:wlst -Dweblogic.os=$os -Dteam=dds -Drun=add-domains -DlistDomains=$domain
do_cmd wlmvn com.oracle.weblogic:wls-maven-plugin:wlst -Dweblogic.os=$os -Dteam=dds -Drun=add-datasources -DlistDomains=$domain -Ddatabase=$database

if [ "sharedservices" == "$domain" ]; then
    echo '*** Running add-jms on sharedservices'
    do_cmd wlmvn com.oracle.weblogic:wls-maven-plugin:wlst -Drun=add-jms -DtargetService=sharedservices -DserviceUrl=localhost:7785
fi

echo '*** Checking for setDomainEnv customizations'
diff -w $WL_DOMAIN.*/bin/setDomainEnv.cmd $WL_DOMAIN/bin/setDomainEnv.cmd 