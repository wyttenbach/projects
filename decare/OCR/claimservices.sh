#!/bin/bash
app=claimservicesapp
jvm=claimservices
uri=com/dds/claim
./update.sh $app $jvm $uri &&
tail -f /apps/WLS/domains/DDS_Dev/servers/$jvm/logs/*.out
