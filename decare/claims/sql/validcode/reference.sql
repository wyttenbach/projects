select *
from SOT01.FND_VALID_CODE_CHILD_REF
where 1=1
and ('&&parentCode' is null or valid_code_parent_id = '&&parentCode')
and ('&&descr_upper_like' is null or upper(descr) like upper('%&&descr_upper_like%'))
order by 1;

undefine descr_upper_like