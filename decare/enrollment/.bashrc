#!/bin/bash
. $PROJECT_HOME/.bashrc-weblogic

export ENR_PROJECT=${ENR_PROJECT:=enrollment}
if [ ! -d $SRC/$ENR_PROJECT ]; then
    echo WARNING: $SRC/$ENR_PROJECT not found!
fi

# for online enrollment
#. $PROJECT_HOME/.bashrc-oe

# for gs-elec-enr
export JSHOMEDIR=c:/tools/GigaSpacesXAPCommunity6.0
