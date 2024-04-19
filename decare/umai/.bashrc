#!/bin/bash
if [ -d $SRC/dds-document-bins ]; then
    . $PROJECT_HOME/.bashrc-weblogic
else
    function lsd {
        echo "Nothing to show"
    }
    function deploy-build {
        echo "Nothing to deploy"
    }
fi

# Note: Not setting XAP_LOOKUP_LOCATORS directly because it affects integration tests
export GS_UI_XAP_LOOKUP_LOCATORS="$(lookup d8a1),$(lookup d8a2)"

# idea
export ECLIPSE_GOAL=eclipse:clean
# eclipse
#export ECLIPSE_GOAL="eclipse:eclipse -Declipse.useProjectReferences=false"

