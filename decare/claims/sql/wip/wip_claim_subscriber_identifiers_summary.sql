select length(s.identifier), count(*)
from clm_wip_claim c, clm_wip_claim_subscriber s
where c.wip_claim_id = s.wip_claim_id
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = c.claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = c.claim_uuid)
and ('&&business_segment_vc' is null or '&&business_segment_vc' is not null and '&&business_segment_vc' = c.business_segment_vc)
and c.ins_date > trunc(sysdate - nvl('&&days', 9999))
group by length(s.identifier)
order by length(s.identifier)

