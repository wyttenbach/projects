select transmission_status_ind, count(*), min(upd_date), max(upd_date)
from clm_entry_encounter
where 1=1
and ins_date > trunc(sysdate - nvl('&&days', 0))
group by transmission_status_ind
