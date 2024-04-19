define end_date='30-Apr-2023'
--original
--SELECT contract.business_segment_vc, contract.group_id 
-- group by
SELECT contract.end_date, count(*)
FROM fnd_gim_contract_vw contract, fnd_gim_status_vw status
WHERE contract.group_id = status.group_id
      AND status.status_vc = 23143
      /* only interested in most recent status */
      AND NOT EXISTS(SELECT 'X' 
                     FROM fnd_gim_status_vw status1 
                     WHERE status1.group_id = contract.group_id 
                           AND status1.status_date > status.status_date)
      AND end_date >= sysdate 
      AND end_date <= '&end_date'
      /* only interested in most recent contract */
      AND NOT EXISTS(SELECT 'X' 
                     FROM fnd_gim_contract_vw contract1 
                     WHERE contract1.group_id = contract.group_id 
                           AND contract1.end_date > '&end_date')
      AND contract.business_segment_vc NOT IN (2,3,4,402,403,404,405,406,407,408,1558,1559,1560,33003)
group by contract.end_date
ORDER BY contract.end_date desc;

