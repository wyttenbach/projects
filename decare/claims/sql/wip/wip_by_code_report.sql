select primary_suspend_code, business_segment_vc, count(*), min(ins_date), max(ins_date)
from clm_wip_claim
where 1=1
and ('&&primary_suspend_code' is null or '&&primary_suspend_code' is not null and '&&primary_suspend_code' = primary_suspend_code)
and ins_date > trunc(sysdate - nvl('&&days', 9999))    
group by rollup(primary_suspend_code, business_segment_vc)
order by to_number(primary_suspend_code)

