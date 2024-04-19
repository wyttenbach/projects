select account_name, count(*)
from iam_app_user
group by account_name
having count(*) > 1
