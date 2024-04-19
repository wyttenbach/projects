select trunc(ins_date), transaction_status_ind, count(*) from clm_ecs_claim
WHERE ins_date > trunc(sysdate - nvl('&&days', 0))
group by rollup(trunc(ins_date), transaction_status_ind)
order by trunc(ins_date), transaction_status_ind;
