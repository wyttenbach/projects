select 'ECS not processed', PAYER_IDENTIFIER, trunc(ins_date), count(*) from clm_ecs_claim
WHERE NOT EXISTS
  (SELECT claim_uuid
  FROM sot13.clm_claim
  WHERE claim_uuid = clm_ecs_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM sot12.clm_claim
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
AND ins_date > trunc(sysdate - nvl('&&days', 0))
group by PAYER_IDENTIFIER, trunc(ins_date)
order by trunc(ins_date);
