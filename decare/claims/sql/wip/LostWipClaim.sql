select c.claim_uuid, c.claim_number, c.transmission_status_ind, c.upd_date, p.workflow_payload_id, t.*
FROM SOT01.WH_TASK t, wh_payload p, clm_wip_claim c
where 1=1
and p.workflow_payload_id = t.task_payload_id(+)
and p.CLIENT_PAYLOAD_ID = c.wip_claim_id
and p.CLIENT_PAYLOAD_TYPE = 'WipClaim'
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
and ('&&claim_source_identifier' is null or '&&claim_source_identifier' is not null and '&&claim_source_identifier' = claim_uuid)
order by claim_source_identifier


