select to_char(INS_DATE, 'YYYY-MM') as month, count(*)
from sot01.drs_document d
where ('&&business_type' is null or upper('&&business_type') = upper(d.business_type))
and ('&&days' is null or d.ins_date > trunc(sysdate - '&&days'))
group by rollup(to_char(INS_DATE, 'YYYY-MM'))
order by 1 desc
