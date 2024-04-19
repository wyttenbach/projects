select u.account_name, u.legal_name, u.source_name, u.source_identifier, v.attribute_1_char
from iam_user_role_assign rel, iam_app_user u, fnd_valid_code_child v
where rel.app_user_id = u.app_user_id
and rel.role_vc = v.valid_code_child_id
and u.end_date is null
and (lower(source_identifier) like '%ou=horizon%'
or lower(account_name) like 'hz%')
order by u.legal_name, v.attribute_1_char
