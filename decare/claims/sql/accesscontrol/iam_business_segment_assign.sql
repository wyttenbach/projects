select u.account_name, u.legal_name, v.attribute_1_char as role_name, v2.attribute_1_char as business_segment
from iam_app_user u, iam_user_role_assign rel, iam_user_role_business_assign b, fnd_valid_code_child v, fnd_valid_code_child v2
where rel.app_user_id = u.app_user_id
and rel.role_vc = v.valid_code_child_id
and rel.USER_ROLE_ASSIGN_ID = b.USER_ROLE_ASSIGN_ID
and b.business_segment_vc = v2.valid_code_child_id
--and u.source_name in ('decare', 'decare-external', 'valdap', 'valdap-external')
and u.end_date is null
and v.attribute_1_char not in ('OnShore')
and ('&&account_name' is null or '&&account_name' is not null and upper('&&account_name') = upper(account_name))
and ('&&business_segment_vc' is null or '&&business_segment_vc' is not null and '&&business_segment_vc' = b.business_segment_vc)
order by account_name, role_name, business_segment;
