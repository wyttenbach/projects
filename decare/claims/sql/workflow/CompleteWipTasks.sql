update (
select t.*
FROM SOT01.WH_TASK t, wh_payload p, clm_wip_claim c
where 1=1
and p.workflow_payload_id = t.task_payload_id(+)
and p.client_payload_id = c.wip_claim_id(+)
and p.CLIENT_PAYLOAD_TYPE = 'WipClaim'
and c.primary_suspend_code >= 700 
and c.primary_suspend_code < 800
and t.task_created_date <= '04-Oct-2013'
) t
SET t.status = 'Completed';

