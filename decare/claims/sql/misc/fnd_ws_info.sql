select * from sot01.fnd_ws_info
where 1=1
and ('&&days' is null or ins_date > trunc(sysdate - '&&days'))
order by ins_date desc
