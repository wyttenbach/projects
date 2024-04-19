select trunc(ins_date), count(*)
from iam_app_user
where end_date is null
group by rollup(trunc(ins_date))
order by trunc(ins_date) desc
