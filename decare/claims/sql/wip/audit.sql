select *
from clm_wip_claim c
where 1=1
and ((PRIMARY_AUDIT_ID is not null and PRIMARY_AUDIT_COMPLETE_DATE is null) or (SECONDARY_AUDIT_ID is not null and SECONDARY_AUDIT_COMPLETE_DATE is null))
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
order by to_number(c.claim_number) desc
