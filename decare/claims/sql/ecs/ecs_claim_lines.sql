select TRANSACTION_STATUS_IND, CLAIM_UUID, PATIENT_FIRST_NAME, PATIENT_LAST_NAME, line.*
from clm_ecs_claim ecs, clm_ecs_claim_line line
where 1=1
and line.ecs_claim_id = ecs.ecs_claim_id
and ecs.ecs_claim_id = nvl('&&ecs_claim_id', ecs.ecs_claim_id)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = ecs.claim_uuid)
order by ins_date desc
