SELECT
    src.source_identifier,
    src.ins_date,
    clm.claim_uuid,
    pat.*
FROM
    sot01.clm_entry_provider    pat,
    sot01.clm_entry_claim       clm,
    sot01.clm_entry_source      src
WHERE
        pat.entry_provider_id = clm.billing_provider_id
    AND src.entry_source_id = clm.entry_source_id
    AND src.source_identifier LIKE '%&&source_identifier'
    AND clm.claim_uuid LIKE '%&&claim_uuid'
    AND 1 = 1
    AND upper(pat.first_name) LIKE upper('%&&first_name')
    AND upper(pat.last_name) LIKE upper('%&&last_name')
    AND clm.ins_date > trunc(sysdate - nvl('&&days', 0))
ORDER BY
    src.source_identifier