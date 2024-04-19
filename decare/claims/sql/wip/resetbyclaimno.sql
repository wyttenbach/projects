update clm_suspended_task set task_status_vc = 38262 where wip_claim_id in (select wip_claim_id from clm_wip_claim where claim_number=&&1)
