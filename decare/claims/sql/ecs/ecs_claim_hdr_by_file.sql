select h.*
from SOT01.CLM_ECS_CLAIM_HDR h
where h.file_id = '&&file_id'
order by h.ECS_CLAIM_HDR_ID
