SET SERVEROUTPUT ON SIZE 1000000
SET TIMING ON
SET ECHO OFF
SET LINESIZE 400

SELECT 'Ortho Payments not processed (SOT22)', COUNT(*)
  FROM sot22.clm_ortho_plan p
  INNER JOIN SOT22.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot22.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '&&begin_date' and trunc(sysdate)
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null)
UNION
SELECT 'Ortho Payments not processed (SOT13)', COUNT(*)
  FROM sot13.clm_ortho_plan p
  INNER JOIN SOT13.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot13.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '&&begin_date' and trunc(sysdate)
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null)
UNION
SELECT 'Ortho Payments not processed (SOT15)', COUNT(*)
  FROM sot15.clm_ortho_plan p
  INNER JOIN SOT15.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot15.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '&&begin_date' and trunc(sysdate)
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null)
UNION
SELECT 'Ortho Payments not processed (SOT23)', COUNT(*)
  FROM sot23.clm_ortho_plan p
  INNER JOIN SOT23.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot23.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '&&begin_date' and trunc(sysdate)
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null)
UNION
SELECT 'Ortho Payments not processed (SOT24)', COUNT(*)
  FROM sot24.clm_ortho_plan p
  INNER JOIN SOT24.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot24.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '&&begin_date' and trunc(sysdate)
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null)



