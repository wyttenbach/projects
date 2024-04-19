#!/bin/bash
. $PROJECT_HOME/.bashrc-weblogic

# Note: Look for -Dgroup.segment in $WL_DOMAIN/setDomainEnv.sh instead
#export GROUP_SEGMENT=${GROUP_SEGMENT:=WLPT}

function get-all
{
    group-co group-parent
}

function post-update
{
    patch-all
}

function deploy-services
{ 
    deploy $SRC/group-parent/groupservices-parent/*/*/*.ear
}

function deploy-web
{
    deploy $SRC/group-parent/groupweb/*/*/*.ear
}
