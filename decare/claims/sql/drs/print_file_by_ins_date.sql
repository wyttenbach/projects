select count(*), trunc(ins_date)
from sot01.drs_print_file
where file_name like 'UAT%'
group by rollup(trunc(ins_date))
order by trunc(ins_date) desc
