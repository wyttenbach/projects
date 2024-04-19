select hc.* from &&sot..gim_group g, &&sot..gim_status hc
where 1=1
and g.group_id = hc.group_id
and ('&&group_id' is null or '&&group_id' = g.group_id)
and ('&&group_number' is null or '&&group_number' = g.group_number);

