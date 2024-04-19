select document_type, count(*)
from &&sot..clm_doc_ref
where 1=1
group by rollup(document_type)
order by document_type


