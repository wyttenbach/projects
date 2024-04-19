select
  trunc(ins_date), business_segment_vc, count(*)
from clm_wip_claim
where
  PRIMARY_SUSPEND_CODE=972
group by trunc(ins_date), business_segment_vc
order by trunc(ins_date) desc, business_segment_vc;
