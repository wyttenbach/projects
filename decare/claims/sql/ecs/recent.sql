select info.PWK_ATTACHMENT_CONTROL_NO, patient_first_name, patient_last_name, patient_date_of_birth, sub.first_name, sub.date_of_birth, sub.subscriber_gender, receive_date
from clm_ecs_claim ecs, SOT01.CLM_ECS_INFORMATION   info, SOT01.CLM_ECS_CLAIM_SUBSCRIBER sub
where ecs.ecs_claim_id = info.ecs_claim_id(+)
and ecs.ecs_claim_id = sub.ecs_claim_id(+)
and ecs.receive_date > sysdate - &&days
order by ins_date desc
