select
role_vc, rol.attribute_1_char as role_name,
application_vc, app.attribute_1_char as app_name,
function_vc, func.attribute_1_char as function_name,
sub_function_vc, sub.attribute_1_char as sub_function_name,
action_vc, act.attribute_1_char as action_name
from fnd_functional_matrix m, fnd_valid_code_child rol, fnd_valid_code_child app, fnd_valid_code_child func, fnd_valid_code_child sub, fnd_valid_code_child act
where 1=1
--and application_context like '/claimsweb'
and m.role_vc = rol.valid_code_child_id
and m.application_vc = app.valid_code_child_id
and m.function_vc = func.valid_code_child_id
and m.sub_function_vc = sub.valid_code_child_id
and m.action_vc = act.valid_code_child_id
order by role_vc, function_vc, sub_function_vc, action_vc;
