SET SERVEROUTPUT ON;
-- The target claim 
--def claim_number='15218722';
def claim_uuid='14b81bf5-fcba-4bb9-9e3c-6644ff1187eb';

column col1 new_value wip_claim_id noprint
select wip_claim_id col1 from clm_wip_claim where claim_uuid='&claim_uuid';

-- Fix Routing 
delete from sot01.clm_claim_tracking where claim_uuid = '&&claim_uuid';
delete from sot01.clm_claim_routing  where claim_uuid = '&&claim_uuid';

-- Process Instance 
DELETE
FROM wf_proc_inst
WHERE instanceid =
  (SELECT WF_WORK_ITEM.PROCESSINSTANCEID
  FROM WF_WORK_ITEM
  WHERE workitemid =
    (SELECT work_item_id
    FROM wh_task
    WHERE task_payload_id =
      (SELECT WORKFLOW_PAYLOAD_ID
      FROM wh_payload
      WHERE CLIENT_PAYLOAD_ID = &&wip_claim_id
      AND client_payload_type = 'WipClaim'
      )
    )
  );
-- Work Item 
DELETE
FROM WF_WORK_ITEM
WHERE workitemid =
  (SELECT work_item_id
  FROM wh_task
  WHERE task_payload_id =
    (SELECT WORKFLOW_PAYLOAD_ID
    FROM wh_payload
    WHERE CLIENT_PAYLOAD_ID = &&wip_claim_id
    AND client_payload_type = 'WipClaim'
    )
  );
-- Task 
DELETE
FROM wh_task
WHERE task_payload_id =
  (SELECT WORKFLOW_PAYLOAD_ID
  FROM wh_payload
  WHERE CLIENT_PAYLOAD_ID = &&wip_claim_id
  AND client_payload_type = 'WipClaim'
  );
-- Payload 
DELETE
FROM wh_payload
WHERE CLIENT_PAYLOAD_ID = &&wip_claim_id
AND client_payload_type = 'WipClaim';

-- WIP 
delete from SOT01.clm_wip_claim_subscriber where wip_claim_id = &&wip_claim_id;
delete from SOT01.clm_wip_claim_patient where wip_claim_id = &&wip_claim_id;
delete from SOT01.clm_wip_claim_provider where wip_claim_id = &&wip_claim_id;
delete from SOT01.clm_wip_claim_patient where wip_claim_id = &&wip_claim_id;
delete from SOT01.clm_wip_claim_policy where association_id = &&wip_claim_id;
delete from SOT01.clm_wip_claim_policy where association_id in (select wip_claim_line_id from clm_wip_claim_line where wip_claim_id = &&wip_claim_id);
--delete from SOT01.clm_wip_correspondence_log where claim_number = '&&claim_number';
delete from SOT01.clm_wip_logical_routine where wip_claim_line_id in (select wip_claim_line_id from clm_wip_claim_line where wip_claim_id = &&wip_claim_id);
delete from sot01.clm_wip_claim_line where wip_claim_id = &&wip_claim_id;
delete from sot01.clm_wip_claim where wip_claim_id = &&wip_claim_id;
