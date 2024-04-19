select *
from clm_ecs_claim
where transaction_status_ind is null
order by ins_date desc;
