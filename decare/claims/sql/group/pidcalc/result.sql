SELECT * 
from sot22.gim_product_id
where 1=1
--and upd_date is not null
and subgroup_id in (SELECT distinct subgroup_id from sot01.fnd_pid_recalc_run_ctl)
--and upd_date > trunc(sysdate) 
order by upd_date desc;
