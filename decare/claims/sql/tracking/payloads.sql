select * from SOT01.WH_TASK task, SOT01.WH_PAYLOAD payload
where task.task_payload_id = payload.workflow_payload_id
and client_payload_type like 'Ortho%'
--and task.task_created_date > sysdate - &&days
order by task.task_created_date desc;
