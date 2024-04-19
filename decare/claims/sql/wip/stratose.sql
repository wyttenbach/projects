select primary_suspend_code, count(*), min(ins_date), max(ins_date)
from clm_wip_claim
where 1=1
and ins_date > trunc(sysdate - &&days)
--and transmission_status_ind is null
and primary_suspend_code in ('960','961')
group by rollup(primary_suspend_code)
order by count(*) desc
