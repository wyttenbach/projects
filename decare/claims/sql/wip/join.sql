select c.claim_number, c.claim_uuid, c.claim_source_identifier as doc_number, s.identifier, s.alt_identifier, s.first_name, s.last_name, p.first_name as patient, p.date_of_birth, l.*
from clm_wip_claim c, clm_wip_claim_patient p, clm_wip_claim_line l, clm_wip_claim_subscriber s
where 1=1
and c.wip_claim_id = p.wip_claim_id
and c.wip_claim_id = l.wip_claim_id
and c.wip_claim_id = s.wip_claim_id
and transmission_status_ind = 'I'
and c.business_segment_vc is null
order by claim_number, line_number
