#!/bin/bash -x
app=$1
jvm=$2
uri=$3
version=0.1-OCR-SNAPSHOT
(cd /tmp/dds/apps/$app/ &&
rm -f *.ear &&
/apps_delivery/DRW/bin/dsi-wget.sh https://mvn.decaresystems.ie/repositories/dds-snapshot/$uri/$app/$version/$app-$version.ear &&
mv $app-$version.ear $app.ear) \
&& \
(cd decare/default/dds/bin &&
./undeployApp.sh $app &&
./bounce.sh $jvm &&
./deployApp.sh $jvm /tmp/dds/apps/$app/$app.ear) 

