select *
--count(*), min(ins_date), max(ins_date)
from clm_entry_claim
where ins_date > trunc(sysdate)
--and transmission_status_ind='P'
--and transmission_status_ind='N' means that the claims are most likely being held for audit!
and ('&&submitter' is null or '&&submitter' is not null and '&&submitter' = submitter)
and ('&&transmission_status_ind' is null or '&&transmission_status_ind' is not null and '&&transmission_status_ind' = transmission_status_ind)
order by ins_date desc
