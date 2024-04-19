select * from clm_audit
where transaction_type_id = 1
and username = nvl('&&username', username)
and end_date is null or end_date > trunc(sysdate - nvl('&&days', 0))
order by username, end_date desc
