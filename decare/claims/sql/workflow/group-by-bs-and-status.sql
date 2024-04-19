select d.business_segment_vc, t.status, count(*)
FROM SOT01.WH_TASK t, wh_payload p, clm_document_image d
where 1=1
and t.task_payload_id = p.workflow_payload_id
--and t.status not in ('Completed')
--and p.CLIENT_PAYLOAD_TYPE = 'ClaimDocument'
and p.client_payload_id = d.document_image_id
group by d.business_segment_vc, t.status
order by d.business_segment_vc, t.status
