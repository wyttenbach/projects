select p.npi, CLAIM_UUID, claim_number, claim_version, claim_status, clm.ins_date, claim_submission_source, claim_source_identifier, external_id, patient_last_name, primary_claim_number
from &&sot..clm_claim clm, &&sot..clm_claim_provider p
where 1=1
and clm.claim_id = p.claim_id
and p.npi like '%&&npi'
--and ins_date > trunc(sysdate - &&days)
order by ins_date desc

