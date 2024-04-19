select * from clm_entry_source source, clm_entry_claim claim
where claim.entry_source_id = source.entry_source_id
and claim.ins_date > sysdate - &&days
and claim.ins_user like 'ak%'
order by claim.ins_date desc;
