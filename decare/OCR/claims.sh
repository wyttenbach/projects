#!/bin/bash
app=claimsapp
jvm=claims
uri=com/dds/claim/ui
./update.sh $app $jvm $uri &&
tail -f /apps/WLS/domains/DDS_Dev/servers/$jvm/logs/*.out
