select d.document_number, d.upd_date as entry_date, t.*, p.*
FROM SOT01.WH_TASK t, wh_payload p, clm_document_image d--, clm_claim_tracking s
--where t.status = 'Completed'
where t.task_payload_id = p.workflow_payload_id
and p.CLIENT_PAYLOAD_TYPE = 'ClaimDocument'
and p.client_payload_id = d.document_image_id
--and s.claim_uuid = d.claim_uuid
order by entry_date desc
