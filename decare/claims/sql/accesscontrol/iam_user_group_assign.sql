select u.account_name, u.legal_name, g.name as group_name
from iam_user_group_assign rel, iam_app_user u, iam_app_group g
where rel.app_user_id = u.app_user_id
and rel.app_group_id = g.app_group_id
and ('&&last_name' is null or '&&last_name' is not null and upper('&&last_name') = upper(last_name))
order by u.account_name, group_name;
