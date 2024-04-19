select trunc(receive_date), transaction_status_ind, count(*)
from clm_ecs_claim ecs
where ecs.receive_date > trunc(sysdate - &&days)
group by trunc(receive_date), transaction_status_ind
order by trunc(receive_date), transaction_status_ind
