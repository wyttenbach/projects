select count(*) 
from clm_claim_routing
where event_time > trunc(sysdate - 1);