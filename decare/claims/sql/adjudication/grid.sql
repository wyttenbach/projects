select table_name
from all_tables 
where owner='SOT96'
and table_name like 'REC%'
order by table_name;

desc SOT96.REC_CLAIM_RESPONSE

select max(ins_date)
from SOT96.REC_CLAIM_RESPONSE;

select * 
from SOT96.REC_CLAIM_RESPONSE
where ins_date > trunc(sysdate)
order by ins_date desc;

select *
from all_tab_columns
where owner='SOT96'
and column_name like 'TIN'
order by table_name, column_name;

select provider_insurer_code, count(*)
from SOT96.REC_CLAIM_RESPONSE
group by provider_insurer_code;