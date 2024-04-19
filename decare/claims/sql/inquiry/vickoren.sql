select sub.subscriber_type_ind, sub.identifier, sub.last_name, sub.ins_date
from SOT01.CLM_WIP_CLAIM_subscriber sub
where 1=1
and sub.ins_date < sysdate - 30
--and sub.subscriber_type_ind in ('M','S')
and sub.last_name like 'VICKOREN'
--and business_segment_vc is null
order by sub.ins_date desc
