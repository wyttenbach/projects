select * from clm_claim_routing
where event_name = 'ENTRY_CLAIM_SUBMITTED'
and event_time < trunc(sysdate)
order by event_time desc
