select attribute_1_char, attribute_2_char from fnd_valid_code_child
where valid_code_child_id in (
select distinct function_vc
from SOT01.FND_FUNCTIONAL_MATRIX
where application_context = '/claimsweb')
