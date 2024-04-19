select transmission_status_ind, count(*), min(ins_date), min(upd_date), max(upd_date)
from clm_wip_claim
where 1=1
and ins_date > trunc(sysdate - nvl('&&days', 0))
group by transmission_status_ind
