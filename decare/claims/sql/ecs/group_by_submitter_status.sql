select submitter_name, transaction_status_ind, count(*)
from clm_ecs_claim ecs
where ecs.receive_date >= trunc(sysdate - nvl('&&days', 0))
group by submitter_name, transaction_status_ind
order by submitter_name, transaction_status_ind;
