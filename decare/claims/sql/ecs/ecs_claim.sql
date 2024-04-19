select c.*
from SOT01.CLM_ECS_CLAIM c, CLM_CLAIM_ROUTING r
where c.claim_uuid = r.claim_uuid
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
and c.ins_date > trunc(sysdate - &&days)
