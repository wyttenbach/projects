select valid_code_parent_id, valid_code_child_id, attribute_1_char, attribute_2_char, attribute_3_char, attribute_4_char
from &&sot..lcl_valid_code_child
where valid_code_parent_id in (
select valid_code_parent_id
from &&sot..lcl_valid_code_child
where valid_code_child_id = &&childCode)
order by valid_code_child_id, valid_code_parent_id, attribute_1_char
