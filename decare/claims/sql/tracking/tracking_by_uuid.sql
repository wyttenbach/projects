select *
from clm_claim_tracking
where claim_uuid = '&&claim_uuid' 
--or      claim_uuid = '&&claim_uuid2'
order by event_time desc;

