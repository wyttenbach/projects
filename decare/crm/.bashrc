#!/bin/bash
export CRM_SEGMENT=${CRM_SEGMENT:=WLPT}

. $PROJECT_HOME/.bashrc-weblogic

function post-update
{
    file=crmweb/web/WEB-INF/weblogic.xml
    (cd $SRC/crm-parent;
    if [[ `git status --porcelain $file` ]]; then
        git diff $file
    else
        inplace 's/(<cookie.*true.*>)/<!--$1-->/' $file
        echo "**** weblogic.xml patched ****"
    fi)
}

## $CRM_SEGMENT taken from environment (not set here)
## affects both patch-ear and -Dcommon.codes.bind.segment

function patch-ear {
    export CRM_EAR=$(cygpath -aw $1)
    echo "Patching $CRM_EAR"
    (cd ~/src/java/xml-dom && do_cmd mvn antrun:run)
}

function deploy-build
{
    undeploy
    deploy-crm
    deploy-crmgroup
}

function deploy-crm
{
    deploy $SRC/crm-parent/*/*/*.ear
}

function deploy-crmgroup
{
    deploy $SRC/crm-parent/crmgroup-parent/*/*/*.ear
}

