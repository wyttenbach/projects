select c.claim_number, c.transmission_status_ind, a.*
from clm_adj a, clm_adj_claim c
where 1=1
and a.adj_id = c.adj_id
and ((PRIMARY_AUDIT_ID is not null and PRIMARY_AUDIT_COMPLETE_DATE is null) or (SECONDARY_AUDIT_ID is not null and SECONDARY_AUDIT_COMPLETE_DATE is null))
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&ins_user' is null or '&&ins_user' is not null and '&&ins_user' = a.ins_user)
and ('&&submitter' is null or '&&submitter' is not null and '&&submitter' = a.submitter)
and a.ins_date > trunc(sysdate - nvl('&&days', 365 * 10))
order by a.ins_date desc
--order by to_number(c.claim_number) desc
