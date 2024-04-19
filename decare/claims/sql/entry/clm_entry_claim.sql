select s.business_segment_vc, transmission_status_ind, c.*
from clm_entry_claim c,clm_entry_source s
where 1=1
and c.entry_source_id = s.entry_source_id
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
and ('&&submitter' is null or '&&submitter' is not null and '&&submitter' = submitter)
and ('&&entry_claim_id' is null or '&&entry_claim_id' = entry_claim_id)
and c.ins_date > trunc(sysdate - nvl('&&days', 0))
order by c.upd_date desc

