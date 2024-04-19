select l.* from clm_wip_claim_line l, clm_wip_claim c
where l.wip_claim_id = c.wip_claim_id
and c.claim_number like '%&&claim_number'
order by line_number
