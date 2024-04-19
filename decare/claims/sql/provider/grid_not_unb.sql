select distinct a.*, c.*
from sot96.grid_provider a, sot96.grid_off_prov_network b, sot96.grid_provider_license c
where a.insurer_code not in ('WELLP','WELLM','DCARE','HORIZ')
and a.valid_npi_ind = 'Y'
and b.insurer_code = a.insurer_code
and b.npi_no = a.npi_no
and b.par_ind = 'Y'
and c.insurer_code = a.insurer_code
and c.npi_no = a.npi_no
and not exists
(select 1
from unb_npi x
where x.npi = '80840'||a.npi_no)
and not exists
(select 1
from unb_license y
where y.state_issued = c.license_state
and y.provider_license_no = c.license)
