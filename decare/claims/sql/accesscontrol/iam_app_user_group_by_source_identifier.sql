select source_name, source_identifier, count(*)
from iam_app_user
where end_date is null
group by rollup(source_name, source_identifier)   
having count(*) > 1
order by count(*) desc
