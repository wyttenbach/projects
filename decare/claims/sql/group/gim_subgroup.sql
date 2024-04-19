select g.group_number, s.*
from &&sot..gim_group g, &&sot..gim_subgroup s
where 1=1
and g.group_id = s.group_id
and ('&&group_id' is null or '&&group_id' = g.group_id)
and ('&&group_number' is null or '&&group_number' = g.group_number)
and ('&&ins_prgm' is null or '&&ins_prgm' = s.ins_prgm)
order by s.ins_date desc
;

