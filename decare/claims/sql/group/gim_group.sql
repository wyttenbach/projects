select * from &&sot..gim_group
where 1=1
and ('&&group_id' is null or '&&group_id' = group_id)
and ('&&group_number' is null or '&&group_number' = group_number);

