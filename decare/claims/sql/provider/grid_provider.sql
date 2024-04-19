select *
from sot96.grid_provider
where 1=1
and ('&&first_name' is null or '&&first_name' is not null and upper('&&first_name') = upper(first_name))
and ('&&last_name' is null or '&&last_name' is not null and upper('&&last_name') = upper(last_name))
