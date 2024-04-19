SELECT
    claim_source_name,
    claim_submission_source,
    COUNT(*)
FROM
    sot22.clm_claim
GROUP BY
    claim_source_name,
    claim_submission_source
ORDER BY
    claim_source_name,
    claim_submission_source