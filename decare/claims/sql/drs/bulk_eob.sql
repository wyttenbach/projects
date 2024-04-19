select document_uuid, count(*)
from sot22.clm_doc_ref
where document_type='EOB' and destination='PROVIDER'
and ins_date > trunc(sysdate - 30)
group by document_uuid
order by 2 desc;