select valid_code_parent_id, valid_code_child_id, attribute_1_char, attribute_2_char, attribute_3_char, attribute_4_char
from &&sot..lcl_valid_code_child
where 1=1
and ('&&parentCode' is null or valid_code_parent_id = '&&parentCode')
and ('&&childCode' is null or valid_code_child_id = '&&childCode')
--and status_ind = 'A'
order by valid_code_child_id
