select * from &&sot..clm_doc_ref
where ins_date > trunc(sysdate - &&days)
order by ins_date desc
