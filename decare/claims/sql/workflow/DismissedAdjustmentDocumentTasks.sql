/*
 * When this happens they can be resubmitted with "UPDATE clm_document_image SET claim_uuid=null WHERE..."
 */
select d.document_image_id, d.claim_uuid, ty.name, d.document_number, d.scan_date, t.*
FROM SOT01.WH_TASK t, wh_payload p, clm_document_image d, clm_claim_type ty
where 1=1
and t.task_payload_id = p.workflow_payload_id
and t.complete_action in ('DismissDocument')
and p.CLIENT_PAYLOAD_TYPE = 'AdjustmentDocument'
and p.client_payload_id = d.document_image_id
and d.claim_type_id = ty.claim_type_id
  and (t.user_id is null or t.user_id like '%&&user_id')
  and (t.actual_owner is null or t.actual_owner like '%&&actual_owner')
  and (t.assigner is null or t.assigner like '%&&assigner')
order by t.last_activity_date desc
