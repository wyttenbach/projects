select t.name, d.*
from SOT01.CLM_DOCUMENT_IMAGE d, clm_claim_type t
where 1=1
and t.claim_type_id = d.claim_type_id
and t.transaction_type_id = 3 
--and batch_number = 1252
and document_number like '%&&document_number'
order by document_number
