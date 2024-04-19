select * from sot01.drs_print_file
where 1=1
and ('&&print_file_id' is null or '&&print_file_id' is not null and '&&print_file_id' = print_file_id)
and ('&&file_location' is null or '&&file_location' is not null and '&&file_location' = file_location)
and ('&&file_name' is null or '&&file_name' is not null and '&&file_name' = file_name)
and ('&&file_name_like' is null or '&&file_name_like' is not null and file_name like '&&file_name_like')
and ('&&ins_user' is null or ins_user like '&&ins_user')
and ('&&days' is null or ins_date > trunc(sysdate - '&&days'))
order by 1 desc;

