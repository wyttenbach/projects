SELECT *
FROM fnd_gim_contract_vw contract
WHERE contract.group_id = 82474
--and g.group_number = '070004'
and contract.business_segment_vc = 412
--and status.status_vc != 23143
order by contract.end_date desc
