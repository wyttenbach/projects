select document_uuid, count(claim_number)
from &&sot..clm_doc_ref r
where ('&&days' is null or r.ins_date > trunc(sysdate - '&&days'))
and r.destination = 'PROVIDER' and r.document_type = 'CHECK'
having count(claim_number) > 1   
group by document_uuid
order by 1 desc
