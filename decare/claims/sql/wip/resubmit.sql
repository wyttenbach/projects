update clm_wip_claim
set transmission_status_ind = 'P',
upd_user='dwyttenb',
upd_date=sysdate,
upd_prgm='SQL'
WHERE wip_claim_id = &&wip_claim_id;