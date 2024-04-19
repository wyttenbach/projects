update clm_adj_claim
set transmission_status_ind = 'P',
upd_user='dwyttenb',
upd_date=sysdate,
upd_prgm='SQL'
WHERE adj_claim_id = &&adj_claim_id;