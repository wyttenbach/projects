SET HEADING OFF;
SET LINESIZE 80
SET TERMOUT OFF
SET VERIFY OFF
SET FEEDBACK OFF

/*select 'sot13 duplicates',claim_uuid, claim_version from sot13.clm_claim where ins_date > sysdate - 29 group by claim_uuid, claim_version having count(*) > 1;
select 'sot15 duplicates',claim_uuid, claim_version from sot15.clm_claim where ins_date > sysdate - 29 group by claim_uuid, claim_version having count(*) > 1;
select 'sot22 duplicates',claim_uuid, claim_version from sot22.clm_claim where ins_date > sysdate - 29 group by claim_uuid, claim_version having count(*) > 1;
select 'sot24 duplicates',claim_uuid, claim_version from sot24.clm_claim where ins_date > sysdate - 29 group by claim_uuid, claim_version having count(*) > 1;

select 'WIP duplicates',claim_uuid, claim_version from sot01.clm_wip_claim group by claim_uuid, claim_version having count(*) > 1 and trunc(max(ins_date)) > sysdate - 29;
*/
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
AND (ins_date between sysdate - 29 and sysdate)
group by PAYER_IDENTIFIER, trunc(ins_date)
order by trunc(ins_date);

SELECT 'WIP not processed', trunc(upd_date), count(*)
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
AND upd_date between sysdate - 29 and sysdate
group by trunc(upd_date) order by trunc(upd_date);

SELECT 'Entry not processed', COUNT(*), trunc(ins_date)
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
AND (ins_date > sysdate - 29) group by trunc(ins_date) order by trunc(ins_date);

select 'Adjustments not processed', trunc(ins_date), count(*) from clm_adj_claim
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
AND ins_date between sysdate - 29 and sysdate
group by trunc(ins_date)
order by trunc(ins_date);

SELECT 'Ortho Payments not processed (SOT22)', trunc(p.upd_date), COUNT(*)
  FROM sot22.clm_ortho_plan p
  INNER JOIN SOT22.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot22.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between sysdate - 29 and sysdate
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null)
group by trunc(p.upd_date)
order by trunc(p.upd_date);

SELECT 'Ortho Payments not processed (SOT13)', trunc(p.upd_date), COUNT(*)
  FROM sot13.clm_ortho_plan p
  INNER JOIN SOT13.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot13.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between sysdate - 29 and sysdate
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null)
group by trunc(p.upd_date)
order by trunc(p.upd_date);

SELECT 'Ortho Payments not processed (SOT15)', trunc(p.upd_date), COUNT(*)
  FROM sot15.clm_ortho_plan p
  INNER JOIN SOT15.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot15.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between sysdate - 29 and sysdate
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null)
group by trunc(p.upd_date)
order by trunc(p.upd_date);

SELECT 'Ortho Payments not processed (SOT23)', trunc(p.upd_date), COUNT(*)
  FROM sot23.clm_ortho_plan p
  INNER JOIN SOT23.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot23.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between sysdate - 29 and sysdate
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null)
group by trunc(p.upd_date)
order by trunc(p.upd_date);

SELECT 'Ortho Payments not processed (SOT24)', trunc(p.upd_date), COUNT(*)
  FROM sot24.clm_ortho_plan p
  INNER JOIN SOT24.clm_ortho_plan_version v
  ON p.ortho_plan_id = v.ortho_plan_id
  INNER JOIN sot24.clm_ortho_payment py
  ON v.ORTHO_PLAN_VERSION_ID = py.ORTHO_PLAN_VERSION_ID
  WHERE py.status            = 'inProcess'
  AND py.upd_date            between sysdate - 29 and sysdate
  and p.plan_number not in (SELECT ortho_plan_number
FROM clm_wip_claim where ortho_plan_number is not null)
group by trunc(p.upd_date)
order by trunc(p.upd_date);

select 'Pending ECS', count(*) from clm_ecs_claim where transaction_status_ind is null;
select 'Pending Entry', count(*) from clm_entry_claim where transmission_status_ind = 'P';
select 'Pending Adj', count(*) from clm_adj_claim where transmission_status_ind = 'P';
select 'Pending WIP', count(*) from clm_wip_claim where transmission_status_ind = 'P';

select 'Technical Suspends', trunc(ins_date), count(0) from clm_wip_claim where PRIMARY_SUSPEND_CODE = '0' group by trunc(ins_date) order by trunc(ins_date);

