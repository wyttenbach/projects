select * from SOT01.FND_VALID_CODE_CHILD_REF
where 1=1
and valid_code_parent_id = &&parentCode
and upper(descr) like upper('%&&descr%') 
order by descr

