SELECT DISTINCT period.business_segment_vc, period.subgroup_id
FROM fnd_gim_subgroup_period_vw period, fnd_gim_status_vw status
WHERE period.subgroup_id = status.subgroup_id
      /* only interested in subgroups with given status (Active=27099) */
      /* TODO: Do not commit; changed = on the next line to <> */
      AND status.status_vc != ?
      /* TODO: Do not commit; added business segment restriction */
      AND period.business_segment_vc=33429
      /* only interested in most recent status */
      AND NOT EXISTS(SELECT 'X' 
                     FROM fnd_gim_status_vw status1 
                     WHERE status1.subgroup_id = period.subgroup_id 
                           AND status1.status_date > status.status_date)
      AND period.end_date >= sysdate 
      AND period.end_date <= ?
      /* only interested in most recent period */
      /* TODO: Do not commit; removed the word NOT from the next line */
      AND EXISTS(SELECT 'X' 
                     FROM fnd_gim_subgroup_period_vw period1
                     WHERE period1.subgroup_id = period.subgroup_id 
                           AND period1.end_date > ?
						   AND period1.period_type = period.period_type)
ORDER BY period.business_segment_vc