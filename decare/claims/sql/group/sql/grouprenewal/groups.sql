SELECT contract.business_segment_vc, contract.group_id
FROM fnd_gim_contract_vw contract, fnd_gim_status_vw status
WHERE contract.group_id = status.group_id
      AND status.status_vc = &1
      /* only interested in most recent status */
      AND NOT EXISTS(SELECT 'X'
                     FROM fnd_gim_status_vw status1
                     WHERE status1.group_id = contract.group_id
                           AND status1.status_date > status.status_date)
      AND end_date >= sysdate
      AND end_date <= &2
      /* only interested in most recent contract */
      AND NOT EXISTS(SELECT 'X'
                     FROM fnd_gim_contract_vw contract1
                     WHERE contract1.group_id = contract.group_id
                           AND contract1.end_date > ?)
ORDER BY contract.business_segment_vc
