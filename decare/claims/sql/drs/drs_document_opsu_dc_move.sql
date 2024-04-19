select *
from sot01.drs_document d
where 1=1
and print_file_id=167839
order by trunc(ins_date) desc, print_file_id, print_file_start_page
