select *
from clm_wip_claim wip
where
  not exists 
    (select *
     from wh_payload wp
       inner join wh_task wt on
         wp.WORKFLOW_PAYLOAD_ID = wt.TASK_PAYLOAD_ID 
     where
       client_payload_id = wip.wip_claim_id and
       wp.client_payload_type = 'WipClaim' and
       wt.status <> 'Completed');
