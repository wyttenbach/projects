https://jira.decaresystems.ie/browse/UMAI-44

https://jira.anthem.com/browse/PRDSDC-16928
================================================================
https://bitbucket.decaresystems.ie/projects/DDSCLAIMS/repos/claim-accumulator-parent/pull-requests/16/overview

claim-accumulator-service/src/test/com/dds/adjudication/accumulator/internal/carryover/CarryoverMaximumIntegrationTest.java

Copy and modify testOneHistoryLine.  Set the coinsurance percentage
for preventive category in the benefit set to 0 (or null), Then add
lot of history lines with DOS in 2000 for preventive category with
total paid amounts over the carryover threshold - this should stop the
carryover from happening. So the accum amount in 2001 should be 0.
After we apply the enhancement there history lines should be ignored
when checking the threshold limit and the accum amount in 2001 should
be back to 250.