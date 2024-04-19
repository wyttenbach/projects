select business_type, count(*)
from sot01.drs_document
where 1=1
group by rollup(business_type)
order by business_type


--select distinct business_type from sot01.drs_document
