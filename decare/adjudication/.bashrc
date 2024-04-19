#!/bin/bash
. $PROJECT_HOME/.bashrc-amq

function lsd
{ 
    echo "Nowhere to deploy"
}

function get-light
{
    (cd $SRC; claims-co claim-director-api) || die
    (cd $SRC; claims-co adjudication-api-parent) || die
    (cd $SRC; claims-co adjudication-parent) || die
}


function get-all
{
    (cd $SRC; claims-co claim-director-api) || die 0
    (cd $SRC; claims-co adjudication-api-parent) || die 1 
    (cd $SRC; claims-co adjudication-externalaccumulators-parent) || die 2
    (cd $SRC; claims-co adjudication-remotefee-parent) || die 3 
    (cd $SRC; claims-co claim-accumulator-parent) || die 4
    (cd $SRC; claims-co oon-gateway-parent) || die 5
    (cd $SRC; claims-co adjudication-parent) || die 6
    (cd $SRC; claims-co adjudication-script-parent) || die 7
    (cd $SRC; atmscr-co anthem-setup-scripts) || die 8
    (cd $SRC; claims-co accumulator-cache-parent) || die 9
}

# function update-all
# {
#     (cd $SRC/claim-director-api && update) || die
#     (cd $SRC/adjudication-api-parent && update) || die
#     (cd $SRC/adjudication-parent && update) || die
# }

# function clean-all
# {
#     (cd $SRC/claim-director-api && clean) || die
#     (cd $SRC/adjudication-api-parent && clean) || die
#     (cd $SRC/adjudication-parent && clean) || die
# }

# function build-all
# {
#     (cd $SRC/claim-director-api && build) || die
#     (cd $SRC/adjudication-api-parent && build) || die
#     (cd $SRC/adjudication-parent && build) || die
# }

function deploy-build
{
    echo "Nothing to deploy"
}

function jee-start
{
    (cd $SRC/adjudication-script-parent/adjudication-reports-sb;  mvn spring-boot:run -Dspring.profiles.active=dev)
}

function go
{
    chrome http://localhost:8080/messages/index.st
}
