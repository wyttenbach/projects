select distinct *
from 
(select rol.attribute_1_char as role_name, app.attribute_1_char as app_name
from fnd_functional_matrix m, fnd_valid_code_child rol, fnd_valid_code_child app
where 1=1
and m.role_vc = rol.valid_code_child_id(+)
and m.application_vc = app.valid_code_child_id(+))
order by role_name, app_name;

