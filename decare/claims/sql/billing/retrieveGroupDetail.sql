SELECT DISTINCT b.clear_plan_no, b.group_number
FROM fnd_gim_bill_subgroup_vw a, gim_subgroup_routing b
WHERE a.subgroup_id = b.subgroup_id
--AND a.bill_id = 568023
AND a.subgroup_id = (SELECT MAX(package_id)
					           FROM bil_bill_inv_cat_pkg c
					           WHERE c.invoice_id = 6276045)
