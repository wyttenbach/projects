select *
from sot01.clm_ecs_claim
WHERE NOT EXISTS
  (SELECT claim_uuid
  FROM sot12.clm_claim
  WHERE claim_uuid = clm_ecs_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM sot13.clm_claim
  WHERE claim_uuid = clm_ecs_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM sot15.clm_claim
  WHERE claim_uuid = clm_ecs_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM sot22.clm_claim
  WHERE claim_uuid = clm_ecs_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM sot23.clm_claim
  WHERE claim_uuid = clm_ecs_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM sot24.clm_claim
  WHERE claim_uuid = clm_ecs_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM clm_wip_claim
  WHERE claim_uuid = clm_ecs_claim.claim_uuid
  )
AND transaction_status_ind = 'P'
and upd_date < trunc(sysdate) and upd_date > trunc(sysdate - nvl('&&days', 1))
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
order by upd_date
