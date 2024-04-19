select r.claim_number
from &&sot..clm_doc_ref r, sot01.drs_document d
where 1=1
and r.document_uuid = d.business_identifier(+)
and ('&&document_uuid' is null or '&&document_uuid' is not null and '&&document_uuid' = r.document_uuid)
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = r.claim_number)
and d.ins_date > trunc(sysdate - nvl('&&days', 0))
group by r.claim_number
having count(d.business_identifier) = 2
order by r.claim_number

