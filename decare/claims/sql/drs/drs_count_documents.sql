select p.file_name, count(*) as document_count
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and ('&&file_name_like' is null or '&&file_name_like' is not null and  p.file_name like '&&file_name_like')
--and ('&&days' is null or d.ins_date > trunc(sysdate - '&&days'))
--and d.cms_name is not null
group by p.file_name
--order by p.file_name, d.print_file_start_page
