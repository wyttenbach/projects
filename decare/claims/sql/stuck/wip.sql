SELECT claim_number, upd_date
FROM clm_wip_claim
WHERE NOT EXISTS
  (SELECT claim_uuid
  FROM sot13.clm_claim
  WHERE claim_uuid  = clm_wip_claim.claim_uuid
  AND claim_version = clm_wip_claim.claim_version
  UNION
  SELECT claim_uuid
  FROM sot15.clm_claim
  WHERE claim_uuid  = clm_wip_claim.claim_uuid
  AND claim_version = clm_wip_claim.claim_version
  UNION
  SELECT claim_uuid
  FROM sot22.clm_claim
  WHERE claim_uuid  = clm_wip_claim.claim_uuid
  AND claim_version = clm_wip_claim.claim_version
  UNION
  SELECT claim_uuid
  FROM sot23.clm_claim
  WHERE claim_uuid  = clm_wip_claim.claim_uuid
  AND claim_version = clm_wip_claim.claim_version
  UNION
  SELECT claim_uuid
  FROM sot24.clm_claim
  WHERE claim_uuid  = clm_wip_claim.claim_uuid
  AND claim_version = clm_wip_claim.claim_version
  )
AND transmission_status_ind = 'I'
AND upd_date < trunc(sysdate)
order by to_number(claim_number)
