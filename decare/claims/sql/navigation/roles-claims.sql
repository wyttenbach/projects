select rol.valid_code_child_id, rol.attribute_1_char as role_name
from fnd_valid_code_child rol
where rol.valid_code_parent_id = 8
and exists (select role_vc from fnd_functional_matrix where role_vc = rol.valid_code_child_id and application_vc = 39811)
order by role_name;
