select *
from &&sot..clm_doc_ref r
where 1=1
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&document_type' is null or '&&document_type' is not null and '&&document_type' = document_type)
and ('&&document_uuid' is null or '&&document_uuid' is not null and '&&document_uuid' = document_uuid)
--and document_type='EOB'
--and destination='SUBSCRIBER'
--and language_id is not null
and ('&&days' is null or r.ins_date > trunc(sysdate - '&&days'))
-- dhinsz 3/26/18
--and claim_number in ('28890124', '28890045', '28890136')
-- pdevlin 12/11/18
--and claim_number in ('33986183', '33986206', '33986111', '33986271')
-- Jeanne Carpenter crm output documents 4/10/19
--and claim_number in ('37180415','37081966')
-- Anne Kennedy OPSQ 1/24/2020
--and claim_number in ('43769823','43769601')
order by r.ins_date desc


