select d.document_image_id, d.scan_date, d.business_segment_vc, ty.name, d.document_number, d.scan_date, t.*
FROM SOT01.WH_TASK t, wh_payload p, clm_document_image d, clm_claim_type ty
where 1=1
and t.task_payload_id = p.workflow_payload_id
and t.status not in ('Completed')
and p.CLIENT_PAYLOAD_TYPE = 'AdjustmentDocument'
and p.client_payload_id = d.document_image_id
and d.claim_type_id = ty.claim_type_id
and d.document_number like '%&&document_number'
--and d.business_segment_vc = 55351
and t.actual_owner like '%&&actual_owner'
order by d.scan_date
