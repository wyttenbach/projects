select * from clm_claim_tracking
where 1=1
--and EVENT_NAME like '%ERROR%'
--and claim_status like 'SUSPENDED'
and CLAIM_SUBMISSION_SOURCE like 'WEB'
--and claim_uuid like '%&&claim_uuid'
and claim_uuid in (select distinct claim_uuid from clm_claim_tracking where source_identifier like '%&&document_number')
--and claim_uuid in (select distinct claim_uuid from clm_claim_tracking where claim_number like '%&&claim_number')
-- and claim_uuid in (select distinct claim_uuid from clm_claim_tracking where upper(subscriber_first_name) LIKE upper('%&&subscriber_first_name'))
-- and claim_uuid in (select distinct claim_uuid from clm_claim_tracking where upper(subscriber_last_name) LIKE upper('%&&subscriber_last_name'))
-- and claim_uuid in (select distinct claim_uuid from clm_claim_tracking where upper(patient_first_name) LIKE upper('%&&patient_first_name'))
-- and claim_uuid in (select distinct claim_uuid from clm_claim_tracking where upper(patient_last_name) LIKE upper('%&&patient_last_name'))
-- and claim_uuid in (SELECT DISTINCT CLAIM_UUID FROM CLM_CLAIM_TRACKING WHERE upper(EVENT_NAME) LIKE upper('%&&event_name'))
-- and claim_uuid in (select distinct claim_uuid from clm_claim_tracking where event_actor like '%&&actor')
order by event_time
