select claim_uuid, count(distinct(claim_number))
from clm_claim_tracking
group by claim_uuid
having count(distinct(claim_number)) > 1
order by count(distinct(claim_number)) desc;
                                             
-- Bruno and I looked at 00d3410a-4535-4341-94bf-ff75b3347246 which is assoc.
-- with claims 5734435 5832719 5909348, all SOT12 DENIED.  ECS submitted multiple times.  D110
