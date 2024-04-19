#!/bin/bash
app=crmapp
jvm=crm
uri=com/dds/crm
./update.sh $app $jvm $uri &&
tail -f /apps/WLS/domains/DDS_Dev/servers/$jvm/logs/*.out
