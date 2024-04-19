SET SERVEROUTPUT ON SIZE 1000000
SET TIMING ON
SET ECHO OFF
SET LINESIZE 400


COLUMN col1 NEW_VALUE vdate NOPRINT
    select to_char(sysdate,'YYYYMMDDHH24MISS') col1 from dual;
COLUMN col2 NEW_VALUE vdb NOPRINT
    select name col2 from v$database;
COLUMN col3 NEW_VALUE vuser NOPRINT
    select user col3 from dual;

SPOOL SR10624_datafix_&&vdb._&&vuser._&&vdate..log


select 'ECS not processed', count(*) from clm_ecs_claim
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
AND (ins_date between '27-FEB-2016' and '01-MAR-2016');

SELECT 'WIP not processed', count(*)
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
AND upd_date < '01-MAR-2016';

SELECT 'Entry not processed', COUNT(*)
FROM clm_entry_claim
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
AND (ins_date between '27-FEB-2016' and '01-MAR-2016');

select 'Adjustments not processed', count(*) from clm_adj_claim
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
AND ins_date between '27-FEB-2016' and '01-MAR-2016';

SELECT 'Ortho Payments not processed (SOT22)', COUNT(*)
  FROM sot22.clm_ortho_plan p
  INNER JOIN SOT22.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot22.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '27-FEB-2016' and '01-MAR-2016'
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null);

SELECT 'Ortho Payments not processed (SOT13)', COUNT(*)
  FROM sot13.clm_ortho_plan p
  INNER JOIN SOT13.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot13.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '27-FEB-2016' and '01-MAR-2016'
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null);

SELECT 'Ortho Payments not processed (SOT15)', COUNT(*)
  FROM sot15.clm_ortho_plan p
  INNER JOIN SOT15.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot15.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '27-FEB-2016' and '01-MAR-2016'
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null);

SELECT 'Ortho Payments not processed (SOT23)', COUNT(*)
  FROM sot23.clm_ortho_plan p
  INNER JOIN SOT23.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot23.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '27-FEB-2016' and '01-MAR-2016'
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null);

SELECT 'Ortho Payments not processed (SOT24)', COUNT(*)
  FROM sot24.clm_ortho_plan p
  INNER JOIN SOT24.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot24.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '27-FEB-2016' and '01-MAR-2016'
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null);

select 'Technical Suspends', trunc(ins_date), count(0) from clm_wip_claim where PRIMARY_SUSPEND_CODE = '0' group by trunc(ins_date) order by trunc(ins_date);

update clm_adj_claim
set transmission_status_ind = 'P',
upd_date = sysdate,
upd_prgm = 'SR10624',
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
AND upd_date between '27-FEB-2016' and '01-MAR-2016';

update sot01.clm_ecs_claim
set transaction_status_ind = null,
upd_date = sysdate,
upd_prgm = 'SR10624',
upd_user = user
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
AND (ins_date between '27-FEB-2016' and '01-MAR-2016');

update sot01.clm_entry_claim
set transmission_status_ind = 'P',
upd_date = sysdate,
upd_prgm = 'SR10624',
upd_user = user
WHERE NOT EXISTS
  (SELECT claim_uuid
  FROM sot12.clm_claim
  WHERE claim_uuid = clm_entry_claim.claim_uuid
  UNION
  SELECT claim_uuid
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
AND (ins_date between '27-FEB-2016' and '01-MAR-2016');

UPDATE sot22.clm_ortho_payment
set status = 'pending',
upd_date = sysdate,
upd_user = user,
upd_prgm ='SR10624'
where ortho_payment_id in (
SELECT py.ortho_payment_id
  FROM sot22.clm_ortho_plan p
  INNER JOIN SOT22.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot22.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '27-FEB-2016' and '01-MAR-2016'
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null));
/* SOT23 */
UPDATE sot23.clm_ortho_payment
set status = 'pending',
upd_date = sysdate,
upd_user = user,
upd_prgm ='SR10624'
where ortho_payment_id in (
SELECT py.ortho_payment_id
  FROM sot23.clm_ortho_plan p
  INNER JOIN SOT23.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot23.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '27-FEB-2016' and '01-MAR-2016'
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null));
/* SOT24 */
UPDATE sot24.clm_ortho_payment
set status = 'pending',
upd_date = sysdate,
upd_user = user,
upd_prgm ='SR10624'
where ortho_payment_id in (
SELECT py.ortho_payment_id
  FROM sot24.clm_ortho_plan p
  INNER JOIN SOT24.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot24.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '27-FEB-2016' and '01-MAR-2016'
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null));
/* SOT13 */
UPDATE sot13.clm_ortho_payment
set status = 'pending',
upd_date = sysdate,
upd_user = user,
upd_prgm ='SR10624'
where ortho_payment_id in (
SELECT py.ortho_payment_id
  FROM sot13.clm_ortho_plan p
  INNER JOIN SOT13.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot13.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '27-FEB-2016' and '01-MAR-2016'
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null));
/* SOT15 */
UPDATE sot15.clm_ortho_payment
set status = 'pending',
upd_date = sysdate,
upd_user = user,
upd_prgm ='SR10624'
where ortho_payment_id in (
SELECT py.ortho_payment_id
  FROM sot15.clm_ortho_plan p
  INNER JOIN SOT15.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot15.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between '27-FEB-2016' and '01-MAR-2016'
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null));

update sot01.clm_wip_claim
set transmission_status_ind = 'P',
upd_date = sysdate,
upd_prgm = 'SR10624',
upd_user = user
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
AND upd_date < '01-MAR-2016';

update clm_wip_claim set transmission_status_ind = 'P',
upd_date = sysdate,
upd_prgm = 'SR10624',
upd_user = user
where PRIMARY_SUSPEND_CODE = '0';

commit;

SPOOL OFF