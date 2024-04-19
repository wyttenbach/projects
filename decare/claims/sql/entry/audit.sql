select submitter, count(*), min(ins_date), max(ins_date)
from clm_entry_claim
where 1=1
and transmission_status_ind='N'
and ins_date > trunc(sysdate - nvl('&&days', 0))
group by rollup(submitter)
order by count(*) desc
