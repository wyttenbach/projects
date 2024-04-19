select submitter_name, transaction_status_ind, count(*), min(ins_date), max(ins_date), min(upd_date), max(upd_date)
from clm_ecs_claim ecs
where 1=1
and ecs.receive_date > trunc(sysdate - nvl('&&days', 0))
group by submitter_name, transaction_status_ind
order by submitter_name, transaction_status_ind;
