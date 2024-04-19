select count(*), claim_status, max(event_time)
from clm_claim_tracking
where 1=1
--and claim_status in ('PROCESSED','DENIED')
and event_time > trunc(sysdate - nvl('&&days', 7))
and event_time < 1+ sysdate - nvl('&&days', 7)
group by rollup(claim_status)
order by count(*)
