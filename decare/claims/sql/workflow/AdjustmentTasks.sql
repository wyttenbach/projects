select t.*
FROM SOT01.WH_TASK t, wh_payload p
where 1=1
and t.task_payload_id = p.workflow_payload_id
and t.status not in ('Completed')
and p.CLIENT_PAYLOAD_TYPE = 'Adjustment'
order by t.actual_owner
