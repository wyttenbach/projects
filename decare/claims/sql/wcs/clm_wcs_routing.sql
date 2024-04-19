select * from clm_claim_routing
where CLAIM_SUBMISSION_SOURCE = 'WEB'
and source_identifier like '%&&wcs_claim_id'
and claim_number like '%&&claim_number'
and claim_uuid like '%&&claim_uuid'
