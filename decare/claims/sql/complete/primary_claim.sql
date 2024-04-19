select CLAIM_UUID, claim_number, claim_version, claim_status, ins_date, claim_submission_source, claim_source_identifier, external_id, patient_last_name, primary_claim_number
from &&sot..clm_claim
where 1=1
and primary_claim_number = '&&primary_claim_number'
order by ins_date desc

