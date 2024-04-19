select grp.group_id, '&1' as segment, cus.customer_number, grp.group_number, grp.name
from &2..GIM_GROUP grp, &2..GIM_CUSTOMER cus
where grp.customer_id = cus.customer_id
and group_id = &3
/
