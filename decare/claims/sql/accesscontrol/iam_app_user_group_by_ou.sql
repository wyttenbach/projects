select source_name, replace(SUBSTR(source_identifier, 1 + Instr(source_identifier, ',', 1, 1)),' ','') OU, count(*)
from iam_app_user
where end_date is null
group by rollup(source_name, replace(SUBSTR(source_identifier, 1 + Instr(source_identifier, ',', 1, 1)),' ',''))
having count(*) > 1
order by source_name, ou
