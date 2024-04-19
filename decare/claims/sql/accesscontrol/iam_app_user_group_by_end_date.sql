select trunc(end_date), count(*)
from iam_app_user
where 1=1
group by rollup(trunc(end_date))
order by trunc(end_date) desc
