select * from 
(select row_number() over (order by p.file_name, d.print_file_start_page) r, p.file_name, d.*
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and p.file_name like 'DRSPDF_DEEEBEXX_ANTHM_02102022_070248.pdf')
where mod(r, 80000) = 0
--where mod(r, 100000) = 0
