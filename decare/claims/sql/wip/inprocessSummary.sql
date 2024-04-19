select count(*), trunc(ins_date)
from clm_wip_claim
where transmission_status_ind = 'I'
and ins_date > trunc(sysdate - nvl('&&days', 0))
group by trunc(ins_date)
order by trunc(ins_date) desc

