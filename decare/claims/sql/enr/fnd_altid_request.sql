select * from sot01.fnd_altid_request 
where 1=1
and NVL(status,'X') <> 'SUCCESS' 
or altid_request_id = 474376
-- and ins_date > trunc(sysdate)
order by 1 desc
