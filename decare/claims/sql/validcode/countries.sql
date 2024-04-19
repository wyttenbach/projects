select
  valid_code_child_id, attribute_1_char, attribute_3_char
from fnd_valid_code_child
where
  valid_code_parent_id = 5
  --and attribute_6_number=1
order by attribute_3_char

