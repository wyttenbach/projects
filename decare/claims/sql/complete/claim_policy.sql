select *
from &&sot..clm_claim c, &&sot..clm_claim_policy p
where c.claim_id = p.association_id(+)
and p.association_type = 'CLAIM'
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
and ('&&policy_code' is null or '&&policy_code' is not null and '&&policy_code' = p.policy_code)
--and c.claim_number = '&&claim_number'
