#!/bin/bash
export LOOKUPLOCATORS=hera.decare.com
export DATA_ZONE_GSC=28
export DIRECTOR_ZONE_GSC=4
export FEEDER_ZONE_GSC=2
./start-agents.sh medusa
#./install.sh -config /apps/adjudication/snapshot-opsd.environment.properties -d hera -a –pre sot15
