select valid_code_child_id from sot23.lcl_valid_code_child
where 1=1
and valid_code_parent_id = &parent
and attribute_1_char in (select attribute_1_char from sot22.lcl_valid_code_child
where valid_code_parent_id = &parent
and valid_code_child_id = &child)
and attribute_2_char in (select attribute_2_char from sot22.lcl_valid_code_child
where valid_code_parent_id = &parent
and valid_code_child_id = &child)
and attribute_3_char in (select attribute_3_char from sot22.lcl_valid_code_child
where valid_code_parent_id = &parent
and valid_code_child_id = &child)
and attribute_4_char in (select attribute_4_char from sot22.lcl_valid_code_child
where valid_code_parent_id = &parent
and valid_code_child_id = &child)
