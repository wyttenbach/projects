#!/bin/bash
server=va33dlvwbl301.decare.com
if [ $# -gt 0 ]; then
    server=$1
    shift
fi
do_cmd wlmvn com.oracle.weblogic:wls-maven-plugin:wlst -Dteam=dds -Drun=add-properties -Dweblogic.remote.server=$server

echo "Be careful! For GIM, you probably want localhost"
echo "For example: groupdojo.groupservices.java.naming.provider.url=t3://localhost:7787"
