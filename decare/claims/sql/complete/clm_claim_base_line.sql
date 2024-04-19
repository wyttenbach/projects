select claim_base_line_id, claim.* 
from sot22.clm_claim claim, sot22.clm_claim_line line
where claim.claim_id = line.claim_id
and line.claim_base_line_id is not null
and claim.ins_date > trunc(sysdate - nvl('&&days', 0))
--and patient_first_name='MARIA'
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim.claim_number)
order by claim.ins_date;

select * from sot22.clm_claim_base_line
where claim_base_line_id=168721;