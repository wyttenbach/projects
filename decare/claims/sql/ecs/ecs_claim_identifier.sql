select trunc(ins_date), count(*)
from SOT01.CLM_ECS_CLAIM c, SOT01.CLM_ECS_CLAIM_SUBSCRIBER s
where c.ecs_claim_id = s.ecs_claim_id
and length(s.IDENTIFIER) = 8
group by rollup(trunc(ins_date))
order by trunc(ins_date) desc
