#!/bin/bash
BIN_DIR=`cd \`dirname $0\`; pwd`
database=opsdd
if [ $# -gt 0 ]; then
    database=$1
    shift
fi
server=va33dlvwbl301.decare.com
if [ $# -gt 0 ]; then
    server=$1
    shift
fi
do_cmd wlmvn com.oracle.weblogic:wls-maven-plugin:wlst -Dteam=dds -Drun=add-domains
do_cmd wlmvn com.oracle.weblogic:wls-maven-plugin:wlst -Drun=add-jms -DtargetService=sharedservices -DserviceUrl=localhost:7785
do_cmd $BIN_DIR/add_ds.sh $database
do_cmd $BIN_DIR/add_properties.sh $server
