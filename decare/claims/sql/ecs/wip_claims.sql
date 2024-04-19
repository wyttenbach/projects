SELECT *
FROM CLM_WIP_CLAIM
WHERE CLAIM_SUBMISSION_SOURCE='ECS'
--and claim_version = '0'
and business_segment_vc = nvl('&&business_segment_vc', business_segment_vc)
and ins_date > trunc(sysdate - nvl('&&days', 0))
order by ins_date desc

