select valid_code_child_id, attribute_11_char from &&sot..lcl_valid_code_child
where valid_code_parent_id in
(select valid_code_parent_id from &&sot..lcl_valid_code_child
where valid_code_child_id = &&childCode)
and valid_code_child_id in (28064, 55251, 70226, 55252, 55253, 55254, 55255, 55256)
order by valid_code_child_id
