select claim.claim_version, line.*
from &&sot..clm_claim claim, &&sot..clm_claim_line line
where claim.claim_id = line.claim_id
--and claim_source_name like 'Conversion'
--and claim_submission_source like '%&&claim_submission_source' -- WEB< ECS< PAPER
--and claim_id > 473100
--and primary_claim_number is not null
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
--and ins_date > trunc(sysdate - nvl('&&days', 0))
--and claim_number in ('722747','845755','696598')
order by 1 desc

