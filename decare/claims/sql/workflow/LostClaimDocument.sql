select d.document_number, d.scan_date, d.claim_uuid, t.*, s.event_time
FROM SOT01.WH_TASK t, wh_payload p, clm_document_image d, clm_claim_tracking s
where 1=1
and t.task_payload_id = p.workflow_payload_id
and p.CLIENT_PAYLOAD_TYPE = 'ClaimDocument'
and p.client_payload_id = d.document_image_id
and d.claim_uuid = s.claim_uuid(+)
and d.document_number like '%&&document_number'
  and (t.user_id is null or t.user_id like '%&&user_id')
  and (t.actual_owner is null or t.actual_owner like '%&&actual_owner')
  and (t.assigner is null or t.assigner like '%&&assigner')
order by s.event_time
