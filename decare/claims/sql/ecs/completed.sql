SELECT *
FROM &&sot..CLM_CLAIM
WHERE CLAIM_SUBMISSION_SOURCE='ECS'
and claim_version = '0'
and processed_date > trunc(sysdate - nvl('&&days', 0))

