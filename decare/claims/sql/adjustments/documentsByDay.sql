select trunc(d.ins_date), count(*)
from SOT01.CLM_DOCUMENT_IMAGE d, clm_claim_type t
where 1=1
and t.claim_type_id = d.claim_type_id
and t.transaction_type_id = 3
and d.ins_date > sysdate - 365
group by trunc(d.ins_date)
order by trunc(d.ins_date) desc
