select *
from sot22.clm_doc_ref
where 1=1
and document_type='LETTER'
and claim_number in (select distinct claim_number from CLM_WIP_GRACE_PERIOD_OUTPUT)
and ins_date > trunc(sysdate - &&days)
order by ins_date desc;
