update clm_entry_claim 
set 
  transmission_status_ind='P', 
  upd_user=user, 
  upd_date=sysdate, 
  upd_prgm='sql'
where
  entry_claim_id = &&entry_claim_id;