select * 
from sot22.clm_claim_ods_log
order by 1 desc;

where 1=1
and ins_date > trunc(sysdate - nvl('&&days', 0))
order by 1 desc;


delete from sot22.clm_claim_ods_log 
where 1=1
and ins_date > trunc(sysdate - nvl('&&days', 0));

commit;