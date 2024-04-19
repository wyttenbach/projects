select TRACKING_ID, CLAIM_UUID, CLAIM_NUMBER, CLAIM_VERSION, CLAIM_STATUS, EVENT_SOURCE, EVENT_NAME, EVENT_TIME, EVENT_ACTOR from clm_claim_tracking
where 1=1
and event_time > sysdate - &&days
order by tracking_id desc
