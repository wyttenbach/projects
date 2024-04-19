select *
from &&sot..CLM_ORTHO_PAYMENT 
where 1=1
--and payment_claim_number like '%&&payment_claim_number'
and ins_date > trunc(sysdate - &&days)
