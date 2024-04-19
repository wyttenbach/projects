select f.last_name, f.first_name, f.middle_int
from npf_national f
where f.last_name = 'RYNDERS'
order by last_name, first_name, middle_int
