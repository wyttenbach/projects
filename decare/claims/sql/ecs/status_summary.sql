SELECT transaction_status_ind, count(*)
from SOT01.CLM_ECS_CLAIM
WHERE 1=1
and INS_DATE > trunc(SYSDATE - nvl('&&days', 0))  
group by rollup(transaction_status_ind)
order by count(*) desc;
