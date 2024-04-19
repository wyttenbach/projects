select
  valid_code_child_id, attribute_3_char as sot, attribute_1_char as code, attribute_2_char as description,
  attribute_6_number as converted, attribute_1_date as convert_date,
  attribute_10_char as remote, ATTRIBUTE_11_CHAR as bank_info_required
from fnd_valid_code_child
where
  valid_code_parent_id = 3
  --and attribute_1_date is not null
order by sot;

