select * from clm_adj_claim
where 1=1
and claim_number like '%&&claim_number'
and ins_user like '%&&ins_user'
and upd_date > sysdate - &&days

