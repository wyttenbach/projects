select * from fnd_valid_code_child
where valid_code_parent_id in
(select valid_code_parent_id from fnd_valid_code_child
where valid_code_child_id = &&childCode)
order by attribute_1_char
--order by valid_code_child_id
