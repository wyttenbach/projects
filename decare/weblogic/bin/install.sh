#!/bin/bash
. ~/bin/java7.sh
do_cmd wlmvn dependency:get
do_cmd wlmvn com.oracle.weblogic:wls-maven-plugin:install
