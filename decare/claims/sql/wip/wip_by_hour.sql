select to_char(ins_date, 'DD-MON-YYYY HH24') as hour_of_day, count(*)
from clm_wip_claim
where 1=1
and primary_suspend_code = &&primary_suspend_code
and ins_date > trunc(sysdate - nvl('&&days', 0))
group by rollup(to_char(ins_date, 'DD-MON-YYYY HH24'))
order by to_char(ins_date, 'DD-MON-YYYY HH24')
