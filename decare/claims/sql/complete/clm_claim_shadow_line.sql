define sot='sot22'
define days=0
define claim_number='71791272'

select claim.claim_number, claim.claim_version, cpa.subscriber_id, claim.subscriber_alt_identifier, claim.patient_first_name, shadow_line.*
from &&sot..clm_claim claim, &&sot..clm_claim_line line, &&sot..clm_claim_shadow_line shadow_line, &&sot..clm_claim_patient_assoc cpa
where claim.claim_id = line.claim_id
--and type='PASS3'
and line.claim_line_id = shadow_line.claim_line_id
and claim.claim_number = cpa.claim_number
--and claim_source_name like 'Conversion'
--and claim_submission_source like '%&&claim_submission_source' -- WEB< ECS< PAPER
--and claim_id > 473100
--and primary_claim_number is not null
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim.claim_number)
--and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
and claim.ins_date > trunc(sysdate - nvl('&&days', 0))
order by claim_shadow_line_id desc;



