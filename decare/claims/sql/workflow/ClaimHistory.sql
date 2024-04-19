select * from wh_task_log
where client_payload_uuid = '&&claim_uuid'
order by event_date
