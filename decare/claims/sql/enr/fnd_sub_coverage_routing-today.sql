select r.interface_date, r.*
from sot01.fnd_sub_coverage_routing r
where r.interface_date > trunc(sysdate)
order by 1 desc
