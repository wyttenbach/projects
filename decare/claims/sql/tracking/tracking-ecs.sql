select c.receive_date, c.payer_identifier, c.transaction_status_ind, s.event_time, s.claim_number, s.claim_status
from clm_claim_tracking s, clm_ecs_claim c
where 1=1
and c.claim_uuid = s.claim_uuid(+)
and c.receive_date > trunc(sysdate - &&days)
and s.claim_number is not null
order by c.receive_date, s.event_time
