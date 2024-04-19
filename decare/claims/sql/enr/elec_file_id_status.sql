select file_id, eep_status_id, vt.attribute_1_char as type, vs.attribute_1_char as status, start_time, finish_time
from fnd_eep_status s, fnd_valid_code_child vt, fnd_valid_code_child vs
where s.type_vc = vt.valid_code_child_id
and s.status_vc = vs.valid_code_child_id
and file_id = &&file_id
order by eep_status_id