SELECT trunc(ins_date), count(*)
FROM SOT01.FND_MESSAGE_LOG
WHERE 1=1
--and ('&&textlike' is null or '&&textlike' is not null and upper(text) like upper('%&&textlike%') )
--and ('&&module_name' is null or '&&module_name' is not null and '&&module_name' = module_name)
and module_name like 'CRM%'
and ins_date > trunc(sysdate - nvl('&&days', 14))
group by trunc(ins_date)
order by trunc(ins_date) desc
