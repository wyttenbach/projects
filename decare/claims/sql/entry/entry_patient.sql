SELECT src.source_identifier, src.ins_date, clm.claim_uuid, pat.*
FROM SOT01.CLM_ENTRY_PATIENT pat, SOT01.CLM_ENTRY_CLAIM clm, SOT01.CLM_ENTRY_SOURCE src
WHERE 1=1
and pat.entry_patient_id = clm.entry_patient_id
and src.entry_source_id = clm.entry_source_id
and upper(first_name) like upper('%&&first_name')
and upper(last_name) like upper('%&&last_name')
and src.source_identifier like '%&&source_identifier'
and clm.claim_uuid like '%&&claim_uuid'
and clm.ins_date > trunc(sysdate - nvl('&&days', 0))
order by src.source_identifier

