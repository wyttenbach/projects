select trunc(ins_date), claim_status, count(*)
from &&sot..PAY_EOB
where 1=1
--and claim_number like '%&&claim_number'
and (trunc(ins_date) = '11-Jun-2020' or  trunc(ins_date) = '04-Jun-2020' or trunc(ins_date) = '18-Jun-2020')
and ins_user = 'postExec'
group by trunc(ins_date), claim_status
order by 1,2

