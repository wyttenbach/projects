#!/bin/bash

# usage: deployApp.sh <servername> [path to ear]
#  <servername>   Server associated with deployment
#                 (accesscontrol, sharedservicesof, sharedservices, ddssharedservices, claimservices, claims, group,
#                  enrollment, crm, billingoutputs)
#  [path to ear]  Full path to deployable code

# WebLogic deploy script
export ServerName=$1
export PathEar=$2

. ./setDomainEnv.sh 
. ./domain.properties 

ear=$(basename $PathEar)
name=${ear%%.ear}
if [ "$name" == "crmapp" ]; then
    name=crm
    echo $name
fi

java weblogic.Deployer -adminurl ${adminurl} -username ${adminusername} -password ${adminpassword} -deploy \
    -targets ${ServerName}  -source ${PathEar} -name ${name}

