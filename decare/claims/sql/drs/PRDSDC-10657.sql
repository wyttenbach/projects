select * from sot01.drs_document
where 1=1
and ins_user = 'PRDSDC10657'
--and cms_name is not null
--and ins_date > trunc(sysdate)
--order by 1
order by print_file_id, print_file_start_page
