select * from clm_adj
where 1=1
and ('&&submitter' is null or '&&submitter' is not null and '&&submitter' = submitter)
order by ins_date desc
