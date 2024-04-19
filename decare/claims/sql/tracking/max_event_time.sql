select claim_status,  max(event_time)
from clm_claim_tracking
--where claim_status = 'PROCESSED'
where event_time > trunc(sysdate)
group by claim_status
order by max(event_time) desc;
