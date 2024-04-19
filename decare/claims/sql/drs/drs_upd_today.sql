select business_identifier, business_type, cms_name, upd_user, upd_date
from sot01.drs_document d
where upd_date > trunc(sysdate - nvl('&&days', 0))
and cms_name is not null      
order by upd_date desc
