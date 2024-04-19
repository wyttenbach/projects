select c.wip_claim_id, claim_number, claim_version, p.first_name, s.* 
from clm_wip_claim c, clm_wip_claim_patient p, clm_wip_claim_subscriber s
where c.claim_version > 0
and c.wip_claim_id = s.wip_claim_id
and c.wip_claim_id = p.wip_claim_id
order by 1 desc
