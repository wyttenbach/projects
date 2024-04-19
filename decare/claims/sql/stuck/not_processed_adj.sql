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

select * from clm_adj_claim
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
AND ins_date between :begin_date and sysdate   
order by upd_date
