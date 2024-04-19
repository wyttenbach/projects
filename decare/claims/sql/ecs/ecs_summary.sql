select trunc(ins_date), count(*)
from SOT01.CLM_ECS_CLAIM   
where 1=1
and ins_date >= trunc(sysdate - nvl('&&days', 0))
group by rollup(trunc(ins_date))
order by trunc(ins_date);
