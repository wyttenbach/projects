select count(*)
from npf_national f
inner join npf_npi i
on f.state_code = i.state_code
and f.business_id = i.business_id
and f.service_office_no = i.service_office_no
where i.npi_type = 'CORPORATE'
and i.npi_no is not null
