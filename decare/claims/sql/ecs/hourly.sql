select to_char(ins_date, 'DD-MON-YYYY HH24'), count(*)
from clm_ecs_claim ecs
where ins_date > trunc(sysdate - &&days)
group by rollup(to_char(ins_date, 'DD-MON-YYYY HH24'))
order by to_char(ins_date, 'DD-MON-YYYY HH24')
