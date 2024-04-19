select * from clm_entry_source source, clm_entry_claim claim
where source.entry_source_id = claim.entry_source_id
and transmission_status_ind='I'
and source.ins_date > trunc(sysdate)
order by claim.ins_date desc
