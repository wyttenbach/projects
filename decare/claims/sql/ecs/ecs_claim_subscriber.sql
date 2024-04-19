select ecs.claim_uuid, sub.*
from clm_ecs_claim ecs, clm_ecs_claim_subscriber sub
where ecs.ecs_claim_id = &&ecs_claim_id
and ecs.ecs_claim_id = sub.ecs_claim_id
order by ins_date desc
