select f.last_name, f.first_name, f.middle_int, i.npi_no
from npf_national f
inner join npf_npi i
on f.license_no = i.license_no
and f.state_code = i.state_code
and f.business_id = i.business_id
and f.service_office_no = i.service_office_no
where i.npi_type = 'PROVIDER'
and f.last_name = 'SMITH'
order by last_name, first_name, middle_int
