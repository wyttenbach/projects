select
  t.task_id, d.document_image_id, d.document_number, d.scan_date,
  p.CLIENT_PAYLOAD_TYPE, t.*
FROM
  SOT01.GEN_WH_TASK t, gen_wh_payload p, gen_document_image d
where 1=1
  and t.task_payload_id = p.workflow_payload_id
  and p.client_payload_id = d.document_image_id
-- and d.document_image_id in (234109,234110,234111)
and d.document_number in ('200189003','200189004','200189005')
--  and p.CLIENT_PAYLOAD_TYPE = 'ENRDOCUMENT'
--  and (t.user_id is null or t.user_id like '%&&user_id')
--  and (t.actual_owner is null or t.actual_owner like '%&&actual_owner')
--  and (t.assigner is null or t.assigner like '%&&assigner')
order by d.document_number;

