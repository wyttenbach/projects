update SOT01.WH_TASK t
set actual_owner='&&actual_owner', user_id='&&actual_owner'
-- No journal columns
--upd_user='dwyttenb', upd_date=sysdate, upd_pgrm='SQL'
where 1=1
and t.task_id = &task_id;

select name, length(NVL(SUBSTR(name, 0, INSTR(name, '.')-1), name)), count(*)
from SOT01.WH_TASK t
--where t.name = 'ENRDOCUMENT.EnterENR'
--group by name
group by name, length(NVL(SUBSTR(name, 0, INSTR(name, '.')-1), name)) 
order by length(NVL(SUBSTR(name, 0, INSTR(name, '.')-1), name));

select name, complete_action, count(*)
from SOT01.WH_TASK t
--where actual_owner like 'd%'
group by name, complete_action
order by name, complete_action