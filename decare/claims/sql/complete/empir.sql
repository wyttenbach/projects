select trunc(ins_date), count(*)
from sot12.clm_claim
group by rollup(trunc(ins_date))
order by trunc(ins_date) desc

