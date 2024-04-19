select trunc(ins_date), count(*)
from sot01.drs_document
where print_file_id is null
group by trunc(ins_date)
order by trunc(ins_date) desc
