select suspend_type_vc, min(rcvd_date), count(*) 
from clm_suspended_task 
group by suspend_type_vc 
order by suspend_type_vc;
