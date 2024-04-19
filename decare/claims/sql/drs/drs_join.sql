select p.file_name, d.*
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and ('&&business_segment' is null or '&&business_segment' is not null and '&&business_segment' = p.business_segment)
and ('&&business_identifier' is null or '&&business_identifier' is not null and '&&business_identifier' = d.business_identifier)
and ('&&file_name_like' is null or '&&file_name_like' is not null and  p.file_name like '&&file_name_like')
and ('&&days' is null or d.ins_date > trunc(sysdate - '&&days'))
--and d.cms_name is not null
order by p.file_name, d.print_file_start_page
