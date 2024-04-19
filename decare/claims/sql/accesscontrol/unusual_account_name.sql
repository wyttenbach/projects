select * from iam_app_user
where 1=1
-- AD migration phase 1: Alphanumeric
and NOT REGEXP_LIKE(account_name, '^[A-Za-z0-9]*$')

-- AD migration phase 2: Anthem ID's
--and NOT REGEXP_LIKE(account_name, '^[A-Za-z]{2}[0-9]*$')
order by account_name desc;
