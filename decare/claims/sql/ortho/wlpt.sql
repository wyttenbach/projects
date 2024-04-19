select 'SOT22' as BUSINESS_SEGMENT, plan.PLAN_NUMBER, vers.original_claim_number
from SOT22.CLM_ORTHO_PLAN plan, SOT22.CLM_ORTHO_PLAN_VERSION vers
where plan.ORTHO_PLAN_ID = vers.ORTHO_PLAN_ID
and vers.original_claim_number = '5898197'
