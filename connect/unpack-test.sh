#!/bin/bash
file=ViersD2D526EZFormService_V6_v5_1_1_0_20230808_032741.bar
if [ $# -gt 0 ]; then
    file="$1"
fi
/bin/rm -rf BAR_IMAGE BAR-META-INF bar.properties && unpack.sh $file
return $?