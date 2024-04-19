SELECT src.source_identifier, sub.last_name, line.*
FROM SOT01.CLM_ENTRY_SUBSCRIBER sub, SOT01.CLM_ENTRY_CLAIM_LINE line, SOT01.CLM_ENTRY_CLAIM clm, SOT01.CLM_ENTRY_SOURCE src
WHERE line.ENTRY_CLAIM_ID = clm.ENTRY_CLAIM_ID
and sub.entry_subscriber_id = clm.entry_subscriber_id
and src.entry_source_id = clm.entry_source_id
and upper(first_name) like upper('%&&first_name')
and upper(last_name) like upper('%&&last_name')
and src.source_identifier like '%&&source_identifier'
order by src.source_identifier

