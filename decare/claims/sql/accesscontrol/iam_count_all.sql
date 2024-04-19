select
(select count(*) from iam_app_group) as groups,
(select count(*) from iam_app_user) as users,
(select count(*) from iam_app_user where end_date is null) as dds_users,
(select count(*) from iam_user_group_assign) as group_assigns,
(select count(*) from iam_user_role_assign) as role_assigns,
(select count(*) from iam_user_role_business_assign) as business_assigns,
(select count(*) from iam_app_user_reject) as rejects
from dual;

