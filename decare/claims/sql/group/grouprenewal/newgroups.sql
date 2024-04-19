SELECT DISTINCT status.business_segment_vc, status.group_id
FROM fnd_gim_status_vw status
WHERE status.status_vc = 23143
      /* only interested in most recent status */
      AND NOT EXISTS(SELECT 'X'
                     FROM fnd_gim_status_vw status1
                     WHERE status1.group_id = status.group_id
                     	AND status1.status_date > status.status_date)
ORDER BY status.business_segment_vc
