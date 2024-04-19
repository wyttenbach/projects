update clm_adj_claim
set transmission_status_ind = 'P',
upd_date = sysdate,
upd_prgm = 'WI203231',
upd_user = user
WHERE NOT EXISTS
  (SELECT claim_uuid
  FROM sot13.clm_claim
  WHERE claim_uuid  = clm_adj_claim.claim_uuid
  AND claim_version = clm_adj_claim.claim_version
  UNION
  SELECT claim_uuid
  FROM sot15.clm_claim
  WHERE claim_uuid  = clm_adj_claim.claim_uuid
  AND claim_version = clm_adj_claim.claim_version
  UNION
  SELECT claim_uuid
  FROM sot22.clm_claim
  WHERE claim_uuid  = clm_adj_claim.claim_uuid
  AND claim_version = clm_adj_claim.claim_version
  UNION
  SELECT claim_uuid
  FROM sot23.clm_claim
  WHERE claim_uuid  = clm_adj_claim.claim_uuid
  AND claim_version = clm_adj_claim.claim_version
  UNION
  SELECT claim_uuid
  FROM sot24.clm_claim
  WHERE claim_uuid  = clm_adj_claim.claim_uuid
  AND claim_version = clm_adj_claim.claim_version
  UNION
  SELECT claim_uuid
  FROM clm_wip_claim
  WHERE claim_uuid  = clm_adj_claim.claim_uuid
  AND claim_version = clm_adj_claim.claim_version
  )
AND transmission_status_ind = 'I'
AND clm_adj_claim.adj_claim_status = 'ADJUSTMENT_READJUDICATION_REQUIRED'
AND upd_date between SYSDATE-30 and SYSDATE-1;
