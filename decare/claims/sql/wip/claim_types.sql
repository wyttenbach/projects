select claim_type_id, transaction_type_id, scanning_reference_number, name from clm_claim_type
where transaction_type_id = 2
order by claim_type_id
--order by scanning_reference_number
