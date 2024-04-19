set MVN_REPO=%USERPROFILE%\.m2\repository
set PROVIDED_LIBS=%MVN_REPO%\javax\jms\jms\1.1\jms-1.1.jar

java -Xdebug -Xrunjdwp:transport=dt_socket,address=8999,server=y,suspend=n -Dadjudication.brokerURL=tcp://localhost:61616 -DapplyFilter=true -Dadjudication.incoming=local.claim.incoming -Dadjudication.outgoing=VirtualTopic.outgoing -DbaseDir=./webapp -Dport=10011 -cp ".;%PROVIDED_LIBS%;.\lib\*;" com.dds.claim.monitor.Start

