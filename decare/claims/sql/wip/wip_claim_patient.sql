select * from clm_wip_claim c, clm_wip_claim_patient p
where c.wip_claim_id = p.wip_claim_id
and claim_number like '%&&claim_number'
