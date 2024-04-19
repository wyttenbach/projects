select clm.claim_number, sub.identifier
from clm_wip_claim_patient pat, clm_wip_claim clm, clm_wip_claim_subscriber sub
where clm.WIP_CLAIM_ID=pat.WIP_CLAIM_ID and pat.WIP_TYPE_IND in ('P', 'S', 'M') and clm.WIP_CLAIM_ID=sub.WIP_CLAIM_ID and sub.WIP_TYPE_IND in ('P', 'S', 'M') and clm.BUSINESS_SEGMENT_VC=2 and pat.last_name = 'ALMOND';
