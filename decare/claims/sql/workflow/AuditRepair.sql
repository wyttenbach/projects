select c.business_segment_vc, c.primary_suspend_code, c.claim_number, p.CLIENT_PAYLOAD_TYPE, t.*
FROM SOT01.WH_TASK t, wh_payload p, clm_wip_claim c
where 1=1
and ((c.PRIMARY_AUDIT_ID is not null and c.PRIMARY_AUDIT_COMPLETE_DATE is null) or (c.SECONDARY_AUDIT_ID is not null and c.SECONDARY_AUDIT_COMPLETE_DATE is null))
and t.task_payload_id = p.workflow_payload_id
and t.status not in ('Ready', 'Completed')
and p.CLIENT_PAYLOAD_TYPE = 'WipClaim'
and t.actual_owner like '%&&actual_owner'
and c.claim_number like '%&&claim_number'
and p.client_payload_id = c.wip_claim_id
order by c.claim_number
