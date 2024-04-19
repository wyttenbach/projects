select *
from &&sot..PAY_EOB
where 1=1
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&eob_document_id' is null or '&&eob_document_id' is not null and '&&eob_document_id' = eob_document_id)


