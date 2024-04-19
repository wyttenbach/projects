select distinct m.function_order, func.attribute_1_char as function_name
from fnd_functional_matrix m, fnd_valid_code_child rol, fnd_valid_code_child app, fnd_valid_code_child func, fnd_valid_code_child sub, fnd_valid_code_child act
where 1=1
--and application_context like '/fs'
and app.attribute_1_char like '%&&app_name'
and m.role_vc = rol.valid_code_child_id(+)
and m.application_vc = app.valid_code_child_id(+)
and m.function_vc = func.valid_code_child_id(+)
and m.sub_function_vc = sub.valid_code_child_id(+)
and m.action_vc = act.valid_code_child_id(+)
order by m.function_order, function_name
