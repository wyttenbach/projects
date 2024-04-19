SELECT line.*
FROM SOT01.CLM_ENTRY_CLAIM_LINE line, SOT01.CLM_ENTRY_CLAIM clm, SOT01.CLM_ENTRY_SOURCE src
WHERE line.ENTRY_CLAIM_ID = clm.ENTRY_CLAIM_ID
and src.entry_source_id = clm.entry_source_id
and src.source_identifier like '%&&source_identifier'

