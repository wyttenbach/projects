select c.customer_number, g.group_number
from &sot..gim_group g, &sot..gim_customer c
where g.customer_id = c.customer_id
and group_id = &group_id
