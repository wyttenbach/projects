. $PROJECT_HOME/.bashrc-weblogic

function get-all
{
    billing-co billingoutputs_parent
}

function check-flag
{
    local grep="LC_ALL=en_US.utf8 grep -Pzo"
    command -v ggrep && grep="ggrep -Pzo"

    local pattern="(?s)PD_ENABLED</param-name>\w</param-value>true"
    command -v ggrep && pattern="PD_ENABLED.*\n.*true"

    echo -n "Checking PD_ENABLED flag in web.xml..."
    file=$SRC/billingoutputs_parent/billingoutputsweb/web/WEB-INF/web.xml

    if [ ! -f $file ]; then
        echo "Unable to locate $file";
        return -1;
    fi;
    $grep "$pattern" $file >/dev/null
    if [ $? == 0 ]; then
        echo "PD_ENABLED=true in $file";
        return -1;
    fi;
    echo ok;
    return 0
}

function build-all
{
    check-flag || die
    (cd $SRC/billingoutputs_parent; cb)
}

