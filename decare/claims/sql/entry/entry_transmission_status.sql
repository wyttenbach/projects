select transmission_status_ind, count(*), min(ins_date), max(ins_date), min(upd_date), max(upd_date)
from clm_entry_claim
where 1=1   
and ('&&submitter' is null or '&&submitter' is not null and '&&submitter' = submitter)
and ins_date > trunc(sysdate - nvl('&&days', 0))
group by transmission_status_ind

