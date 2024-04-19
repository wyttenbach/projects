SELECT module_name, count(*)
FROM SOT01.FND_MESSAGE_LOG
where 1=1
and ins_date > trunc(sysdate - nvl('&&days', 0))
group by module_name
order by module_name
