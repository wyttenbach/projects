#!/bin/bash
export MVN_REPO=~/.m2/repository
export MICHAL_OPTS="-Dadjudication.incoming=local.claim.incoming -Dadjudication.outgoing=VirtualTopic.outgoing"
export DALE_OPTS=
DIR1=$PROJECT_HOME/adjudication/adjudication-script-parent/adjudication-harness
DIR2=$DIR1/target/adjudication-harness-1.0-SNAPSHOT/adjudication-harness-1.0-SNAPSHOT/
if [ -d "$DIR2" ]; then
    (cd $DIR2; 
        CLASSPATH=.
        classpath $MVN_REPO/javax/jms/jms/1.1/jms-1.1.jar
        classpath ./lib/*
        echo $CLASSPATH
        OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=8999,server=y,suspend=n \
            -Dadjudication.brokerURL=tcp://localhost:61616 \
            -DapplyFilter=true $DALE_OPTS -DbaseDir=./webapp -Dport=10011 \
            com.dds.claim.monitor.Start"
        echo java $OPTS
        java $OPTS
    )
else
    echo Build $DIR1
    exit 1
fi
