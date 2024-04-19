#!/bin/bash

# DRS
. $PROJECT_HOME/.bashrc-tomcat
. $PROJECT_HOME/.bashrc-jetty

function refresh
{
    (update-all && rebuild-all) 2>&1 | tee $SRC/refresh.out
    tada
}

function deploy-build
{
    echo Nothing to deploy
}
