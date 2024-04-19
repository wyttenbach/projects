select claim_type_id, transaction_type_id, scanning_reference_number, name from clm_claim_type
where 1=1
--and transaction_type_id = &&transaction_type_id
order by
claim_type_id
--scanning_reference_number
