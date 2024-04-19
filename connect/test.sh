#!/bin/bash
$PH/unpack-test.sh $@ && $PH/pack-test.sh
exit $?