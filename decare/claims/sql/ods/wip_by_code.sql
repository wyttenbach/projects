select sysdate as time_now, primary_suspend_code, count(*), min(ins_date), max(ins_date)
from clm_wip_claim
where 1=1
and ins_date > trunc(sysdate - nvl('&&days', 0))
and primary_suspend_code in (970, 971, 972)
group by rollup(primary_suspend_code)
order by count(*) desc
