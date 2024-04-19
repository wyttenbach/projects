SELECT
    sot23.clm_claim.claim_number,
    sot23.clm_claim.ins_date
FROM
    sot23.clm_claim
WHERE
     sot23.clm_claim.subscriber_alt_identifier='3HZN29313590'
ORDER BY
    sot23.clm_claim.ins_date DESC