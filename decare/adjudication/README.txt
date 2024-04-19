#!/bin/bash
# Adjust build order with:
# bash ../README.txt

function rename
{
    dest="$1"
    src="$(echo "$dest" | sed 's/.-//')"
    if [ -d "$src" ]; then
        do_echo mv "$src" "$dest"
    fi
}

rename 0-claim-director-api
rename 1-adjudication-api-parent
rename 2-adjudication-externalaccumulators-parent
rename 3-adjudication-remotefee-parent
rename 4-claim-accumulator-parent
rename 5-oon-gateway-parent
rename 6-adjudication-parent
rename 7-adjudication-script-parent
rename 8-anthem-setup-scripts
rename 9-accumulator-cache-parent

# mbali 3-Feb-2023
# the adjudication rest api can be used to check how is the provider loaded in warmstart db
# clinic_id, provider_id
# http://va33dlvxap300.decare.com:8080/adjudication-pu-monitoring-4.81-SNAPSHOT-pu/provider/UNBRANDED-787507-808446/UNBRANDED/787507/808446/matchingproviderdatasnapshots
# d6993b22-78d2-4dca-b874-a7b6b1f9aa31UNBRANDED-787507-808446UNBRANDED7875078084462018-09-24292278993-11-22489423891693366808401992834360808401205328721329220 Westchester Ave Ste 104White Plains1060436WESTCHESTER329DiklaChazbani004falsefalseWLPT
