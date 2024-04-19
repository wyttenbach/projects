select sub.subgroup_id, '&1' as segment, cus.customer_number, grp.group_number, sub.subgroup_number, sub.name
from &2..GIM_SUBGROUP sub, &2..GIM_GROUP grp, &2..GIM_CUSTOMER cus
where grp.customer_id = cus.customer_id  
and sub.group_id = grp.group_id
and subgroup_id = &3
/
