select c.claim_number, c.claim_version, p.first_name
from sot23.clm_claim_provider p, sot23.clm_claim c
where c.claim_id = p.claim_id
and p.first_name is null and p.last_name='HOLDEN';

