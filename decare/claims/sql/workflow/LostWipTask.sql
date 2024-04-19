select c.claim_number, c.PRIMARY_SUSPEND_CODE, p.client_payload_id, t.*
FROM SOT01.WH_TASK t, wh_payload p, clm_wip_claim c
where 1=1
and p.workflow_payload_id = t.task_payload_id(+)
and p.client_payload_id = c.wip_claim_id(+)
and p.CLIENT_PAYLOAD_TYPE = 'WipClaim'
and c.claim_number like '%&&claim_number' 
and c.claim_source_identifier like '%&&document_number'
  and (t.user_id is null or t.user_id like '%&&user_id')
  and (t.actual_owner is null or t.actual_owner like '%&&actual_owner')
  and (t.assigner is null or t.assigner like '%&&assigner')
order by last_activity_date


