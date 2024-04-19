#!/bin/bash

# WebLogic undeploy script
# usage: undeployApp.sh <deployment name>
#  <deployment>   Name of deployed application (e.g. claimsapp-2.2)

name=$1
if [ "$name" == "crmapp" ]; then
    name=crm
    echo $name
fi

. ./setDomainEnv.sh 
. ./domain.properties 
ver="1.0"



java weblogic.Deployer -adminurl ${adminurl} -username ${adminusername} -password ${adminpassword}  -undeploy \
    -name ${name}
