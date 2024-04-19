select trunc(ins_date, 'MM'), count(*)
from sot22.clm_claim
--where customer_id is null
group by trunc(ins_date, 'MM')
order by trunc(ins_date, 'MM') desc;
