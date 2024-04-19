select
  valid_code_child_id, attribute_1_char, ins_date, upd_date
from fnd_valid_code_child
where
  valid_code_parent_id = 9
order by attribute_1_char

