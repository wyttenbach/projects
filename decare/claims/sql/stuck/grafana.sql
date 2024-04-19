SELECT
  claim_uuid,EVENT_TIME,claim_number,
  NVL(CLAIM_STATUS,'UNDEFINED'),
  NVL(EVENT_SOURCE,'UNDEFINED'),
  NVL(EVENT_NAME,'UNDEFINED')
FROM SOT01.CLM_CLAIM_TRACKING
WHERE claim_uuid NOT IN
  (SELECT claim_uuid
  FROM SOT01.CLM_CLAIM_TRACKING
  WHERE ((CLAIM_STATUS ='SUSPENDED'
  AND EVENT_SOURCE     ='WIP'
  AND EVENT_NAME       ='SAVE_WIP_CLAIM')
  OR (CLAIM_STATUS     ='PROCESSED'
  AND EVENT_SOURCE     ='COMPLETE_CLAIMS'
  AND EVENT_NAME       ='ADD_COMPLETE_CLAIM')
  OR (CLAIM_STATUS     ='DENIED'
  AND EVENT_SOURCE     ='COMPLETE_CLAIMS'
  AND EVENT_NAME       ='ADD_COMPLETE_CLAIM'))
-- AND EVENT_TIME >= TO_DATE('2018/03/05 00:00:00', 'YYYY/MM/DD HH24:MI:SS')
-- AND EVENT_TIME <= TO_DATE('2018/03/07 23:59:59', 'YYYY/MM/DD HH24:MI:SS')
and EVENT_TIME > trunc(sysdate - nvl('&&days', 0))
  )
AND (
    (CLAIM_STATUS ='SUSPENDED'
    AND EVENT_SOURCE     ='WIP'
    AND EVENT_NAME       ='REPAIRED_CLAIM_SUBMITTED') OR
    (CLAIM_STATUS ='ADJUDICATION'
    AND EVENT_SOURCE     ='ADJUSTMENT'
    AND EVENT_NAME       ='ECS_CLAIM_SUBMITTED') OR
    (CLAIM_STATUS ='ENTRY'
    AND EVENT_SOURCE     ='ENTRY'
    AND EVENT_NAME       ='ENTRY_CLAIM_SUBMITTED') OR
    (CLAIM_STATUS ='ENTRY'
    AND EVENT_SOURCE     ='ENTRY'
    AND EVENT_NAME       ='WEB_CLAIM_SUBMITTED') OR
        (CLAIM_STATUS ='ADJUDICATION'
    AND EVENT_SOURCE     ='ECS_FEEDER'
    AND EVENT_NAME       ='ENTER_ECS_CLAIM') OR
        (CLAIM_STATUS ='ADJUDICATION'
    AND EVENT_SOURCE     ='ADJUSTMENT'
    AND EVENT_NAME       ='ADJUSTMENT_SUBMITTED') OR
    (CLAIM_STATUS is null
    AND EVENT_SOURCE     ='ORTHO'
    AND EVENT_NAME       ='ORTHO_PAYMENT_CLAIM_SUBMITTED')
  )
-- AND EVENT_TIME >= TO_DATE('2018/03/05 00:00:00', 'YYYY/MM/DD HH24:MI:SS')
-- AND EVENT_TIME <= TO_DATE('2018/03/07 23:59:59', 'YYYY/MM/DD HH24:MI:SS')
and EVENT_TIME > trunc(sysdate - nvl('&&days', 0))
and EVENT_TIME <= sysdate - interval '60' minute;
