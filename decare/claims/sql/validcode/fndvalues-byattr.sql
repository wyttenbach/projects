select valid_code_parent_id, valid_code_child_id, attribute_1_char, attribute_2_char, attribute_3_char, attribute_4_char
from fnd_valid_code_child
where upper(attribute_1_char) like upper('%&&descr%')
or upper(attribute_2_char) like upper('%&&descr%')
or upper(attribute_3_char) like upper('%&&descr%')
or upper(attribute_4_char) like upper('%&&descr%')
or upper(attribute_5_char) like upper('%&&descr%')
or upper(attribute_6_char) like upper('%&&descr%')
or upper(attribute_7_char) like upper('%&&descr%')
or upper(attribute_8_char) like upper('%&&descr%')
or upper(attribute_9_char) like upper('%&&descr%')
or upper(attribute_10_char) like upper('%&&descr%')
order by valid_code_parent_id, valid_code_child_id;

undefine descr