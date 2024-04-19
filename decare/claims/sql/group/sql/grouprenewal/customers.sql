SELECT DISTINCT customer.business_segment_vc, customer.customer_id
FROM FND_GIM_CUSTOMER_VW customer, fnd_gim_status_vw status
WHERE customer.customer_id = status.customer_id
      AND status.status_vc = &1 /* 23143 */
      /* only interested in most recent status */
      AND NOT EXISTS(SELECT 'X'
                     FROM fnd_gim_status_vw status1
                     WHERE status1.customer_id = customer.customer_id
                           AND status1.status_date > status.status_date)
ORDER BY customer.business_segment_vc
