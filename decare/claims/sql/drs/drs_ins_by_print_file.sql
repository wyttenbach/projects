select ins_prgm, count(*)
from sot01.drs_document d
where ins_date > trunc(sysdate - nvl('&&days', 0))
group by rollup(ins_prgm)
order by ins_prgm
