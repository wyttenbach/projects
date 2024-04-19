select business_identifier, business_type, cms_name, ins_date
from sot01.drs_document
where business_identifier in (select business_identifier
	from sot01.drs_document
	group by business_identifier
	having count(business_identifier) > 1)
order by to_number(business_identifier)
