select business_segment_vc, customer_id, count(*)
from sot01.fnd_sub_coverage_routing
group by business_segment_vc, customer_id
order by 3 desc
