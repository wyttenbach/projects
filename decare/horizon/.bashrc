. $PROJECT_HOME/.bashrc-weblogic

# web
function hpp-local
{
    if [ $# -gt 0 ]; then
        export WBL_SERVER=$(lookup $1)
    fi
    export GWT_COMMAND="gwt:run"
    (cd $SRC/horizon-parent/horizonproviderportal-web; ./run.sh)
    echo ab94485/anypw
    echo Reload in Internet Explorer mode
}

# services
# function verify
# {
#     # DRS test
#     #    (cd $PH/soapui; ./getdocument.sh 123)
#     check-log
# }

function go
{
    echo "Use SoapUI (services) or hpp-local (web)"
}

function get-all
{
    hpp-co horizon-parent
}

function deploy-services
{ 
    deploy $SRC/horizon-parent/horizonservice-parent/*/*/*.ear
}

function ldap-test
{
    ldapsearch -x -b "ou=providers,ou=people,ou=horizon,dc=horizondental,dc=com" -H ldap://va10_secure_external_ldap.decare.com:397 -D "uid=smadmin,ou=people,ou=administrators,dc=horizondental,dc=com" -W
}
