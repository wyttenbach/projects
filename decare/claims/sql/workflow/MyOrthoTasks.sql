/*
 * No related document
 */
select p.*, t.*
FROM SOT01.WH_TASK t, wh_payload p--, clm_wip_claim o
where 1=1
and t.task_payload_id = p.workflow_payload_id
--and p.client_payload_id = o.wip_claim_id
and t.status not in ('Completed')
and p.CLIENT_PAYLOAD_TYPE = 'OrthoTreatmentPlan'
and t.actual_owner like '%&&actual_owner'
order by t.actual_owner
