select print_file_id, count(*)
from sot01.drs_document d
where 1=1 --print_file_id in (169364,169365)
and ins_user = 'PRDSDC10657'
group by print_file_id
