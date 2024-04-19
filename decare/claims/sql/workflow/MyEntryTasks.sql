-- NOTE NOTE NOTE NOTE
-- Not useful for 'simple' claims which have no related document image
-- NOTE NOTE NOTE NOTE
select d.document_number, d.scan_date, d.business_segment_vc, ct.name as bin, t.actual_owner, t.assigner, t.name, t.status as task_status
FROM SOT01.WH_TASK t, wh_payload p, clm_document_image d, clm_claim_type ct
where 1=1
and t.task_payload_id = p.workflow_payload_id
and d.claim_type_id = ct.claim_type_id
and t.status not in ('Completed')
and p.CLIENT_PAYLOAD_TYPE = 'ClaimDocument'
and p.client_payload_id = d.document_image_id
and d.document_number like '%&&document_number'
and t.actual_owner like '%&&actual_owner'
order by actual_owner, d.scan_date
