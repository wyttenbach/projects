select p.file_name, d.*
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and ('&&business_segment' is null or '&&business_segment' is not null and '&&business_segment' = p.business_segment)
and ('&&business_type' is null or '&&business_type' is not null and '&&business_type' = d.business_type)
and ('&&days' is null or d.ins_date > trunc(sysdate - '&&days'))
--and d.cms_name is not null
order by p.print_file_id desc
