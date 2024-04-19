select u.source_name, u.account_name, u.legal_name, v.attribute_1_char as role_name
from iam_app_user u, iam_user_role_assign rel, fnd_valid_code_child v
where rel.app_user_id = u.app_user_id
and rel.role_vc = v.valid_code_child_id
and u.source_name in ('decare', 'decare-external')
and u.end_date is null
and v.attribute_1_char in ('OnShore')
and ('&&account_name' is null or '&&account_name' is not null and upper('&&account_name') = upper(account_name))
order by source_name, account_name, role_name;
