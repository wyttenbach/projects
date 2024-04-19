select c.*
from SOT01.CLM_ECS_CLAIM_HDR h, SOT01.CLM_ECS_CLAIM c
where c.ECS_CLAIM_HDR_ID = h.ECS_CLAIM_HDR_ID
and h.file_id = '&&file_id'
--order by c.ECS_CLAIM_HDR_ID, c.ECS_CLAIM_ID
