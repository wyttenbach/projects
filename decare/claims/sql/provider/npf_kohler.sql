select tin, license_no, office_state, f.last_name, f.first_name, f.middle_int, office_addr1
from npf_national f
where f.last_name = 'KOHLER'
order by last_name, first_name, middle_int
