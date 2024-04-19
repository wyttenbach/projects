select claim_number, primary_suspend_code, transmission_status_ind, ins_date, upd_date, upd_user 
from clm_wip_claim
where business_segment_vc=33429
and primary_suspend_code='950'
and ins_date > trunc(sysdate - 10)    
order by ins_date desc;

update clm_wip_claim 
set transmission_status_ind='P', upd_user='dwyttenb', upd_date=sysdate 
where claim_number='68982883';

select claim_number, primary_suspend_code, transmission_status_ind, ins_date, upd_date, upd_user 
from clm_wip_claim
where upd_date > trunc(sysdate - 10)    
order by upd_date desc;

select * 
from clm_claim_routing
where claim_number='68982883'
order by event_time desc;

select * 
from clm_claim_tracking 
where claim_number='68982883'
order by event_time desc;