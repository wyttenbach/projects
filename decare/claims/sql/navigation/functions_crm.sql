select distinct m.function_order, func.attribute_1_char as function_name
from fnd_functional_matrix m, fnd_valid_code_child app, fnd_valid_code_child func
where 1=1
and app.attribute_1_char = 'CRM'
and m.application_vc = app.valid_code_child_id(+)
and m.function_vc = func.valid_code_child_id(+)
order by 1;