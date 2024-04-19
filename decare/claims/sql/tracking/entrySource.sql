select * from clm_entry_source
where ins_date > sysdate - &&days
order by ins_date desc;
