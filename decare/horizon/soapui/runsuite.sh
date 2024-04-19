#!/bin/bash
for documentIdentifier in `cat list.txt`; do
    echo "Running documentIdentifier=\"$documentIdentifier\""
    ./getdocument.sh $documentIdentifier
    status=$?
    if [ $status != 0 ]; then
        echo $0: Exiting with $status on documentIdentifier=$documentIdentifier
        exit $status
    fi
done
exit 0