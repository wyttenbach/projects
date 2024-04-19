SELECT count(subgroup_id)
FROM sot22.gim_subgroup s, sot22.gim_group g, sot22.gim_customer c
where g.customer_id = c.customer_id
and g.group_id = s.group_id
and c.customer_number='0001062267';
-- OPSSF 864
-- OPSPP 1024 groups 10488 subgroups