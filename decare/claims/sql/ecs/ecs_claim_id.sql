select claim_uuid, ecs.*
from clm_ecs_claim ecs
where claim_uuid in (select distinct claim_uuid from clm_ecs_claim where ecs_claim_id = &&ecs_claim_id)
order by ins_date desc
