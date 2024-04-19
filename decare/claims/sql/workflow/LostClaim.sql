select p.workflow_payload_id, t.*
FROM SOT01.WH_TASK t, wh_payload p
where 1=1
and p.workflow_payload_id = t.task_payload_id(+)

and p.CLIENT_PAYLOAD_TYPE = 'Preadjudication_Claim'
and p.CLIENT_PAYLOAD_ID = (select entry_claim_id from clm_entry_claim where submitter='&&submitter')


--and p.CLIENT_PAYLOAD_TYPE = 'WipClaim'
--and p.CLIENT_PAYLOAD_ID = (select wip_claim_id from clm_wip_claim where claim_number = '&&1')


