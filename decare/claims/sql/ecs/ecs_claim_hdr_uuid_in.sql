select h.*
from SOT01.CLM_ECS_CLAIM_HDR h, SOT01.CLM_ECS_CLAIM c
where c.ECS_CLAIM_HDR_ID = h.ECS_CLAIM_HDR_ID
and c.claim_uuid in ('6d766147-ebb2-40b2-9c5c-6b4bd7b56ef2','58121e1c-f5de-41ae-9aa0-75926a9ff3c5','30723c92-9777-43f7-ba6c-674ee7c23320')
--order by c.ECS_CLAIM_HDR_ID, c.ECS_CLAIM_ID
