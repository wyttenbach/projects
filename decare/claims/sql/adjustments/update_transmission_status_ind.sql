update clm_adj_claim
       set TRANSMISSION_STATUS_IND='P', 
       upd_user='dwyttenb',
       upd_date=sysdate,
       upd_prgm='sql'
where 1=1
and claim_number='7294690'
and claim_version=6;

