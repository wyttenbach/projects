select count(*)
from clm_claim_tracking
where event_time > trunc(sysdate)
