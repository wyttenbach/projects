select *
from sot01.drs_document d
where 1=1
and ('&&business_identifier' is null or '&&business_identifier' is not null and '&&business_identifier' = business_identifier)
and ('&&print_file_id' is null or '&&print_file_id' is not null and '&&print_file_id' = print_file_id)
and ('&&cms_name_like' is null or '&&cms_name_like' is not null and cms_name like '&&cms_name_like')
and ('&&ins_prgm' is null or ins_prgm like '&&ins_prgm')
--and ins_prgm like '%WLPT_PRES_ORTHO_LTRS_RPT_20140806064817%'
and ('&&upd_prgm' is null or upd_prgm like '&&upd_prgm')
and ('&&upd_days' is null or upd_date > trunc(sysdate - '&&upd_days'))
--and ('&&days' is null or ins_date > trunc(sysdate - '&&days'))
and ins_date > trunc(sysdate - nvl('&&days', 90))
order by print_file_id desc, print_file_start_page
