select claim.claim_uuid, claim.claim_number, claim.claim_version, code.*
from clm_adj_claim claim, clm_adj_claim_icd_code code
where code.adj_claim_id = claim.adj_claim_id
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim.claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim.claim_uuid)

