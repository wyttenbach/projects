#!/bin/bash
(cd $SRC/provider-master-data-api/api && mvn -Dsurefire.excludedGroups= -Dtest=com.anthem.specialty.provider.api.BootstrapTest test)
