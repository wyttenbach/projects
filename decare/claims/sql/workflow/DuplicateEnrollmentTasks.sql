select d.document_number, count(t.task_id)
FROM
  SOT01.GEN_WH_TASK t, gen_wh_payload p, gen_document_image d
where 1=1
  and t.task_payload_id = p.workflow_payload_id
  and p.client_payload_id = d.document_image_id
  --and d.document_image_id in (234109,234110,234111,234120)
  and t.name = 'ENRDOCUMENT.EnterENR'
  and t.status = 'Ready'
group by d.document_number
having count(t.task_id) > 1