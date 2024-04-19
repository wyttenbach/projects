SELECT (count(*)/1200/24 + sysdate)
from SOT01.CLM_ECS_CLAIM
WHERE transaction_status_ind is null

