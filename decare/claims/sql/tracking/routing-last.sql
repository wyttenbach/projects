select *
from clm_claim_routing
where
  EVENT_TIME = 
    (select max(event_time)
     from clm_claim_routing) and
  rownum = 1;

