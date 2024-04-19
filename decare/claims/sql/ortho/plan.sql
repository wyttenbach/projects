select 'SOT22' as BUSINESS_SEGMENT, plan.PLAN_NUMBER, vers.original_claim_number
from SOT22.CLM_ORTHO_PLAN plan, SOT22.CLM_ORTHO_PLAN_VERSION vers
where plan.ORTHO_PLAN_ID = vers.ORTHO_PLAN_ID
and plan.PLAN_NUMBER in ('41402','88682','53622','97067','132262','50442','132261')
union
select 'SOT15' as BUSINESS_SEGMENT, plan.PLAN_NUMBER, vers.original_claim_number
from SOT15.CLM_ORTHO_PLAN plan, SOT15.CLM_ORTHO_PLAN_VERSION vers
where plan.ORTHO_PLAN_ID = vers.ORTHO_PLAN_ID
and plan.PLAN_NUMBER in ('41402','88682','53622','97067','132262','50442','132261')
union
select 'SOT13' as BUSINESS_SEGMENT, plan.PLAN_NUMBER, vers.original_claim_number
from SOT13.CLM_ORTHO_PLAN plan, SOT13.CLM_ORTHO_PLAN_VERSION vers
where plan.ORTHO_PLAN_ID = vers.ORTHO_PLAN_ID
and plan.PLAN_NUMBER in ('41402','88682','53622','97067','132262','50442','132261')
union
select 'SOT24' as BUSINESS_SEGMENT, plan.PLAN_NUMBER, vers.original_claim_number
from SOT24.CLM_ORTHO_PLAN plan, SOT24.CLM_ORTHO_PLAN_VERSION vers
where plan.ORTHO_PLAN_ID = vers.ORTHO_PLAN_ID
and plan.PLAN_NUMBER in ('41402','88682','53622','97067','132262','50442','132261')

