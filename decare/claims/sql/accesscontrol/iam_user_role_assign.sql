select u.account_name, u.legal_name, u.source_name, u.source_identifier, v.attribute_1_char, rel.ins_date
from iam_user_role_assign rel, iam_app_user u, fnd_valid_code_child v
where rel.app_user_id = u.app_user_id
and rel.role_vc = v.valid_code_child_id
and ('&&last_name' is null or '&&last_name' is not null and upper('&&last_name') = upper(last_name))
order by u.legal_name, v.attribute_1_char
