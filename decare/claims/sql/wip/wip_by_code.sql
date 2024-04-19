select *
from clm_wip_claim
where 1=1
and ('&&primary_suspend_code' is null or '&&primary_suspend_code' is not null and '&&primary_suspend_code' = primary_suspend_code)
and ins_date > trunc(sysdate - nvl('&&days', 9999))    
order by ins_date desc
