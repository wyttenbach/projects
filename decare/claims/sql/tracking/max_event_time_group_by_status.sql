select sysdate as TIME_NOW, count(*), claim_status, max(event_time)
from clm_claim_routing
where event_time > trunc(sysdate - nvl('&&days', 0))
group by rollup(claim_status)
order by max(event_time) desc;
