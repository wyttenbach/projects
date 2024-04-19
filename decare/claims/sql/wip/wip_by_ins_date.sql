select trunc(ins_date), count(*)
from clm_wip_claim
where 1=1
and ('&&primary_suspend_code' is null or '&&primary_suspend_code' is not null and '&&primary_suspend_code' = primary_suspend_code)
-- 0 -- technical
-- 960 -- Waiting for Stratose pricing
-- 961 -- Stratose (2nd WL domain on hart/foster)
-- 970, 971, 972 -- ODS gateway (EAServer on ceta/sparta)
and ins_date > trunc(sysdate - nvl('&&days', 0))
group by rollup(trunc(ins_date))
order by trunc(ins_date) desc    
