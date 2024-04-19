select
  *
from clm_entry_claim
where upd_date > trunc(sysdate)
order by upd_date desc

