1. Identify recent print file: drs_recent.sql

2. Copy with pres:
pres is a function
pres () 
{ 
    export PRES_ENV=${PRES_ENV:=qd};
    echo PRES_ENV=${PRES_ENV};
    do_echo scp -q $(scplookup pd):/pres_archive/$1 $(scplookup $PRES_ENV):/test_pres_archive
}

3. Get list of claim numbers for testing: claims_by_print_file_name.sql

4. Test with drs-ui:
drs-ui is a function
drs-ui () 
{ 
    local env=prod;
    if [ $# -gt 0 ]; then
        env="$1";
        shift;
    fi;
    local dir=$PROJECTS/claims/$env/claim-test;
    if [ ! -d "$dir" ]; then
        echo "$dir: No such directory.";
        return;
    fi;
    echo dir=$dir;
    local script=com.dds.claim.groovy.ClaimDocumentSwing;
    local args=swingme;
    ( cd $dir;
    pwd && nohup mvn -o exec:java -Dexec.mainClass=$script -Dexec.args=$args -Dclaims.env="$env" & );
    drs-log $env
}


