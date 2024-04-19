select d.business_identifier
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and d.business_identifier is not null
and p.file_location = '/test_pres_archive/'
and d.business_type = 'EOB'
and d.ins_date > '01-May-2019'
and rownum < 10
