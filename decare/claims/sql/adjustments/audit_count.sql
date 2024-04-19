select count(c.claim_number), min(c.ins_date), max(c.ins_date)
from clm_adj a, clm_adj_claim c
where 1=1
and a.adj_id = c.adj_id
and ((PRIMARY_AUDIT_ID is not null and PRIMARY_AUDIT_COMPLETE_DATE is null) or (SECONDARY_AUDIT_ID is not null and SECONDARY_AUDIT_COMPLETE_DATE is null))
and c.ins_date > (sysdate - &&days)
