-- queryall
SELECT business_segment_vc, c.customer_number, c.customer_id, COUNT(ctl.subgroup_id)
FROM fnd_pid_recalc_run_ctl ctl, sot22.gim_customer c, sot22.gim_group g, sot22.gim_subgroup s
WHERE 1=1
--and business_segment_vc=33429
and s.subgroup_id=ctl.subgroup_id
and g.group_id=s.group_id
and c.customer_id=g.customer_id
--and processed_ind = 'N'
group by business_segment_vc, c.customer_number, c.customer_id
ORDER BY 4 desc;
