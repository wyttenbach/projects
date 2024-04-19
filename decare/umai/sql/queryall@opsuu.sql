SELECT
    i.claim_type_id,
    COUNT(*)
FROM
    clm_document_image i, clm_claim_type t
WHERE
    t.transaction_type_id = 1
    AND i.xray_ind = 'Y'
    --AND i.ins_date < '01-MAR-2022'
GROUP BY
    i.claim_type_id
ORDER BY
    i.claim_type_id DESC;

