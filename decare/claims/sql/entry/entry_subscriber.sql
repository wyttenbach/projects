SELECT sub.date_of_birth, sub.first_name, sub.last_name, src.source_identifier, clm.*
FROM SOT01.CLM_ENTRY_SUBSCRIBER sub, SOT01.CLM_ENTRY_CLAIM clm, SOT01.CLM_ENTRY_SOURCE src
WHERE sub.entry_subscriber_id = clm.entry_subscriber_id
and src.entry_source_id = clm.entry_source_id
and upper(last_name) like upper('%&&last_name')
and src.source_identifier like '%&&source_identifier'
and sub.identifier like '%&&subscriber_identifier'
order by sub.ins_date desc

