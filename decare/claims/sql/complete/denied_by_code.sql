select to_number(p.policy_code), count(*)
from &&sot..clm_claim c, &&sot..clm_claim_policy p
where c.claim_id = p.association_id(+)
and p.association_type = 'CLAIM'
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = c.claim_number)
and c.ins_date > trunc(sysdate - nvl('&&days', 0))
group by rollup(to_number(p.policy_code))
order by to_number(p.policy_code)
