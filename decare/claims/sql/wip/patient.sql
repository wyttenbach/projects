select distinct 
  s.identifier, c.business_segment_vc, c.claim_number, p.*
from 
  SOT01.CLM_WIP_CLAIM_PATIENT p, SOT01.CLM_WIP_CLAIM c, 
  SOT01.CLM_WIP_CLAIM_SUBSCRIBER s
where
  c.wip_claim_id in 
    (select wip_claim_id
     from clm_wip_claim_patient
     where
       upper(first_name) like upper('%&&first_name') and
       upper(last_name) like upper('%&&last_name')) and
  c.wip_claim_id = p.wip_claim_id and
  c.wip_claim_id = s.wip_claim_id

