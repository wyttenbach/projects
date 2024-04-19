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

select * from clm_entry_claim
WHERE NOT EXISTS
  (SELECT claim_uuid
  FROM sot13.clm_claim
  WHERE claim_uuid = clm_entry_claim.claim_uuid
  UNION
  SELECT claim_uuid
  FROM sot12.clm_claim
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
AND ins_date between :begin_date and sysdate    
order by entry_claim_id

