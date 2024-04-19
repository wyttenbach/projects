select source_name, count(*)
from iam_app_user
where end_date is null
group by rollup(source_name)
order by source_name
