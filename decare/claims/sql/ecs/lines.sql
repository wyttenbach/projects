select claim_uuid, line.*
from clm_ecs_claim ecs, SOT01.CLM_ECS_CLAIM_LINE line
where ecs.ecs_claim_id = line.ECS_CLAIM_ID
--and upper(patient_first_name) like upper('%&&patient_first_name')
--and upper(patient_last_name) like upper('%&&patient_last_name')
--and ecs.ECS_CLAIM_ID in (1685316, 1657132)  
and ecs.claim_uuid like '%&&claim_uuid'
order by ins_date desc
