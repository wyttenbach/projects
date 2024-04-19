select *
from &&sot..CLM_ORTHO_PLAN_VERSION vers
where 1=1
and vers.original_claim_number like '%&&original_claim_number'
and ins_date > trunc(sysdate - &&days)
