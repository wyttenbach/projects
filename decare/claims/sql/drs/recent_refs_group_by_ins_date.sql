select trunc(ins_date), count(*) from &&sot..clm_doc_ref
where ins_date > trunc(sysdate - &&days)
group by trunc(ins_date)
order by trunc(ins_date) desc
