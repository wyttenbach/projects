#!/bin/bash
. java.sh 11

endpoint=va10plvaws304.decare.com:8080
echo endpoint=$endpoint

# Horizon claim 54852919 EOP
id=7aabf1b0-d726-4809-b42e-aed1da72a60d

#cmd=$TOOLS/SoapUI-5.5.0/bin/testrunner.bat
cmd=/Applications/SoapUI-5.6.0.app//Contents/java/app/bin/testrunner.sh
$cmd -r -a -f responses -Pendpoint=$endpoint -PdocumentIdentifier=$id drs-soapui-project.xml 
exit $?

