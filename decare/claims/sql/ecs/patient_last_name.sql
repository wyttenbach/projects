select claim_uuid, ecs.*
from clm_ecs_claim ecs
where 1=1
and upper(patient_first_name) = upper('&&patient_first_name')
and upper(patient_last_name) = upper('&&patient_last_name')
--order by ins_date desc
order by claim_total_charge_amount
