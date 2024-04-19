update clm_ecs_claim
set transaction_status_ind = null,
upd_user='dwyttenb',
upd_date=sysdate,
upd_prgm='SQL'
WHERE ecs_claim_id = &&ecs_claim_id;