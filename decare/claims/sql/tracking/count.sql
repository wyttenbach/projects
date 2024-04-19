select count(distinct(claim_uuid)) from clm_claim_tracking
where 1=1
and event_time > sysdate - &&days
