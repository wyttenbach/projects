SET SERVEROUTPUT ON SIZE 1000000
SET TIMING OFF
SET ECHO OFF
SET LINESIZE 100
SET HEADING OFF
SET VERIFY OFF
SET FEEDBACK OFF

accept days prompt "How many days back to consider (default 0, today only): " default 0

var begin_date varchar2(20)
exec :begin_date := trunc(sysdate - &&days);

select * from clm_ecs_claim
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
AND ins_date between :begin_date and sysdate    
order by ecs_claim_id

