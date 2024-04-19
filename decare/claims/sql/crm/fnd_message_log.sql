SELECT l.*
FROM SOT01.FND_MESSAGE_LOG l
WHERE 1=1
and ('&&textlike' is null or '&&textlike' is not null and upper(text) like upper('%&&textlike%') )
--and ('&&module_name' is null or '&&module_name' is not null and '&&module_name' = module_name)
--and module_name like 'CRM%'
--and module_name = 'ClaimsEntryProviderSearch'
--and message_type_ind = 'E'
and ins_date > trunc(sysdate - nvl('&&days', 0))
order by 1 desc
