#!/bin/bash
database=opsdd
if [ $# -gt 0 ]; then
    database=$1
    shift
fi
domains=
if [ $# -gt 0 ]; then
    domains=-DlistDomains=$1
    shift
fi
echo Running with $database $domains
do_cmd wlmvn com.oracle.weblogic:wls-maven-plugin:wlst -Dteam=dds -Drun=add-datasources -Ddatabase=$database $domains

