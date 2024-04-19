select f.file_name, d.ins_date, d.business_identifier, d.cms_name, d.upd_date
from sot01.drs_document d, sot01.drs_print_file f
where d.print_file_id = f.print_file_id
and upper(f.file_name) like '%.PDF' and f.ins_date > (sysdate - &&days)
and ('&&business_identifier' is null or '&&business_identifier' = d.business_identifier)
order by f.file_name desc


