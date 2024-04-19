select
role_vc, rol.attribute_1_char as role_name,
application_vc, app.attribute_1_char as app_name, m.application_order,
function_vc, func.attribute_1_char as function_name, m.function_order,
sub_function_vc, sub.attribute_1_char as sub_function_name, m.sub_function_order,
action_vc, act.attribute_1_char as action_name,
m.ins_user, m.ins_date, m.ins_prgm, m.upd_user, m.upd_date, m.upd_prgm
from fnd_functional_matrix m, fnd_valid_code_child rol, fnd_valid_code_child app, fnd_valid_code_child func, fnd_valid_code_child sub, fnd_valid_code_child act
where 1=1
and m.role_vc = rol.valid_code_child_id(+)
and m.application_vc = app.valid_code_child_id(+)
and m.function_vc = func.valid_code_child_id(+)
and m.sub_function_vc = sub.valid_code_child_id(+)
and m.action_vc = act.valid_code_child_id(+)
and ('&&upper_like_role_name' is null or upper(rol.attribute_1_char) like '%&&upper_like_role_name%')
and ('&&upper_like_app_name' is null or upper(app.attribute_1_char) like '%&&upper_like_app_name%')
and ('&&upper_like_function_name' is null or upper(func.attribute_1_char) like '%&&upper_like_function_name%')
and ('&&upper_like_sub_function_name' is null or upper(sub.attribute_1_char) like '%&&upper_like_sub_function_name%')
and ('&&upper_like_action_name' is null or upper(act.attribute_1_char) like '%&&upper_like_action_name%')
--and act.attribute_1_char is not null
order by role_name, app_name, function_name, sub_function_name, action_name;
--order by role_name, app_name, function_name, sub_function_name;
--order by function_name, sub_function_name;
--order by sub_function_name;
