select c.claim_uuid, c.claim_number, c.primary_suspend_code, t.*
FROM SOT01.WH_TASK t, wh_payload p, clm_wip_claim c
where 1=1
and t.task_payload_id = p.workflow_payload_id
and p.client_payload_id = c.wip_claim_id
and t.status not in ('Completed')
and p.CLIENT_PAYLOAD_TYPE = 'WipClaim'
--and c.business_segment_vc = 55351
and t.actual_owner like '%&&actual_owner'
--and t.assigner like '%&&assigner'
order by t.task_created_date
