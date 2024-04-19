select h.*
from SOT01.CLM_ECS_CLAIM_HDR h, SOT01.CLM_ECS_CLAIM c
where c.ECS_CLAIM_HDR_ID = h.ECS_CLAIM_HDR_ID
--and c.claim_uuid = '&&claim_uuid'
and h.ECS_CLAIM_HDR_ID = &&ECS_CLAIM_HDR_ID
--order by c.ECS_CLAIM_HDR_ID, c.ECS_CLAIM_ID
