select vers.original_claim_number, vers.treatment_stop_date, pay.ins_date, pay.payment_claim_number, pay.planned_payment_date, pay.status
from &&sot..CLM_ORTHO_PAYMENT pay, &&sot..CLM_ORTHO_PLAN_VERSION vers
where pay.ORTHO_PLAN_VERSION_ID = vers.ORTHO_PLAN_VERSION_ID
and vers.original_claim_number = '&&original_claim_number'
--and vers.original_claim_number = '5898197'
--and vers.original_claim_number = '2595972'
