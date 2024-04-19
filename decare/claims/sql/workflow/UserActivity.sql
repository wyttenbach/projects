select *
FROM SOT01.WH_TASK t
where 1=1
  and (t.user_id is null or t.user_id like '%&&user_id')
  and (t.actual_owner is null or t.actual_owner like '%&&actual_owner')
  and (t.assigner is null or t.assigner like '%&&assigner')
and LAST_ACTIVITY_DATE  > trunc(sysdate - &&days)
order by LAST_ACTIVITY_DATE desc
