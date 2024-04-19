#!/bin/bash
BIN_DIR=$(cd $(dirname $0); pwd)
database=opsdd
if [ $# -gt 0 ]; then
    database=$1
    shift
fi

if [ -z "$WL_DOMAIN" ]; then
    echo "WL_DOMAIN not set"
    exit 1
fi

domain=$(basename $WL_DOMAIN)
if [ $# -gt 0 ]; then
    domain=$1
    shift
fi

dir="$WL/domains/$domain"
if [ ! -d "$dir" ]; then
    echo "Domain '$dir' does not exist"
    exit 1
fi

echo Running with $database $domain
do_cmd $BIN_DIR/remove_ds.sh $domain
do_cmd $BIN_DIR/add_ds.sh $database $domain


