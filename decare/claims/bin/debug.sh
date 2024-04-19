#!/bin/bash
if [ -d X:/com/dds ]; then
    echo Using X:/
    export MAVEN_REPO=X:/
fi
mvn gwt:debug -Dgwt.extraJvmArgs="-Xmx512M" -Dgwt.noserver=true