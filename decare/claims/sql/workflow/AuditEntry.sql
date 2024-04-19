select e.*, p.CLIENT_PAYLOAD_TYPE, t.*
FROM SOT01.WH_TASK t, wh_payload p, clm_entry_claim e
where 1=1
and t.task_payload_id = p.workflow_payload_id
--and t.status not in ('Ready', 'Completed')
and p.CLIENT_PAYLOAD_TYPE = 'Preadjudication_Claim'
and e.submitter like '%&&submitter'
and e.claim_uuid like '%&&claim_uuid'
and p.client_payload_id = e.entry_claim_id
order by t.actual_owner
