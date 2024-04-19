select distinct role_vc, rol.attribute_1_char as role_name from fnd_functional_matrix m, fnd_valid_code_child rol
where application_context like '/claimsweb' and m.role_vc = rol.valid_code_child_id order by role_name;
-- plus the 3 'Supervisor' roles that are needed for Workflow?
