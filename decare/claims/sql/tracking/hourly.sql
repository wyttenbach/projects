select to_char(event_time, 'DD-MON-YYYY HH24') as hour_of_day, count(*)
from clm_claim_tracking
where 1=1
and claim_status in ('PROCESSED','DENIED')
and event_time >= trunc(sysdate - nvl('&&days', 0)) and event_time < trunc(sysdate - nvl('&&days', 0) + 1)
group by rollup(to_char(event_time, 'DD-MON-YYYY HH24'))
order by to_char(event_time, 'DD-MON-YYYY HH24')
