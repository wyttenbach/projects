#!/bin/bash
domains=
if [ $# -gt 0 ]; then
    domains=-DlistDomains=$1
    shift
fi
echo Removing datasources $domains
do_cmd wlmvn com.oracle.weblogic:wls-maven-plugin:wlst -Dteam=dds -Drun=remove-datasources $domains

