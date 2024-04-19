select count(*) from clm_entry_claim
where 1=1
and transmission_status_ind = 'P'
order by ins_date desc
