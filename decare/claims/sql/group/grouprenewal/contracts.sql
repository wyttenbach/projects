select * from &sot..GIM_CONTRACT contract, &sot..GIM_GROUP grp
where contract.group_id = grp.group_id
and group_number = '&group_number'
