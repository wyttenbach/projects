select *
from clm_entry_claim
WHERE NOT EXISTS
  (SELECT claim_uuid
  FROM sot13.clm_claim
  WHERE claim_uuid = clm_entry_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM sot15.clm_claim
  WHERE claim_uuid = clm_entry_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM sot22.clm_claim
  WHERE claim_uuid = clm_entry_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM sot23.clm_claim
  WHERE claim_uuid = clm_entry_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM sot24.clm_claim
  WHERE claim_uuid = clm_entry_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM clm_wip_claim
  WHERE claim_uuid = clm_entry_claim.claim_uuid
  )
AND transmission_status_ind = 'I'
and upd_date < trunc(sysdate) and upd_date > trunc(sysdate - nvl('&&days', 1))
--and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
order by upd_date
