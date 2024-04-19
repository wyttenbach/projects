select table_name
from all_tables
where table_name like 'FND_PR_%'
order by table_name;

select * from sot01.FND_PR_PRV_PROVIDER_1;