select 
  matrix.role_vc role_vc, role_child.attribute_1_char role_name, 
  role_child.attribute_2_char role_display, role_child.status_ind role_status, 
  matrix.application_vc application_vc, 
  application_child.attribute_1_char application_name, 
  application_child.attribute_2_char application_display, 
  application_child.status_ind application_status, 
  matrix.function_vc function_vc, function_child.attribute_1_char function_name, 
  function_child.attribute_2_char function_display, 
  function_child.status_ind function_status, 
  matrix.sub_function_vc sub_function_vc, 
  sub_function_child.attribute_1_char sub_function_name, 
  sub_function_child.attribute_2_char sub_function_display, 
  sub_function_child.status_ind sub_function_status, matrix.action_vc action_vc, 
  action_child.attribute_1_char action_name, 
  action_child.attribute_2_char action_display, 
  action_child.status_ind action_status, 
  matrix.application_order application_order, 
  matrix.function_order function_order, 
  matrix.sub_function_order sub_function_order, 
  matrix.application_context application_context, 
  matrix.server_port server_port, matrix.landing_page landing_page, 
  matrix.status_check_file status_check_file, 
  matrix.action_mapping action_mapping
from fnd_functional_matrix matrix
  left outer join fnd_valid_code_child role_child on
    matrix.role_vc = role_child.valid_code_child_id 
  left outer join fnd_valid_code_child application_child on
    matrix.application_vc = application_child.valid_code_child_id 
  left outer join fnd_valid_code_child function_child on
    matrix.function_vc = function_child.valid_code_child_id 
  left outer join fnd_valid_code_child sub_function_child on
    matrix.sub_function_vc = sub_function_child.valid_code_child_id 
  left outer join fnd_valid_code_child action_child on
    matrix.action_vc = action_child.valid_code_child_id

