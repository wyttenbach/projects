select p.*
--CLAIM_NUMBER, CLAIM_SUBMISSION_SOURCE, CLAIM_SOURCE_NAME, CLAIM_SOURCE_IDENTIFIER, ins_date
from &&sot..clm_claim c, &&sot..clm_claim_policy p
where c.claim_id = p.association_id(+)
and p.association_type = 'CLAIM'
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = c.claim_number)
and c.ins_date > trunc(sysdate - nvl('&&days', 0))
order by c.ins_date desc
