select info.PWK_ATTACHMENT_CONTROL_NO, patient_first_name, patient_last_name, patient_date_of_birth, prov.tin, prov.last_name as provider_last_name, receive_date
from clm_ecs_claim ecs, SOT01.CLM_ECS_INFORMATION   info, SOT01.CLM_ECS_CLAIM_PROVIDER prov
where ecs.ecs_claim_id = info.ecs_claim_id
and ecs.ecs_claim_id = prov.ecs_claim_id
and ('&&patient_first_name' is null or '&&patient_first_name' is not null and upper('&&patient_first_name') = upper(patient_first_name))
and ('&&patient_last_name' is null or '&&patient_last_name' is not null and upper('&&patient_last_name') = upper(patient_last_name))
and ('&&provider_first_name' is null or '&&provider_first_name' is not null and upper('&&provider_first_name') = upper(prov.first_name))
and ('&&provider_last_name' is null or '&&provider_last_name' is not null and upper('&&provider_last_name') = upper(prov.last_name))
order by ins_date desc
