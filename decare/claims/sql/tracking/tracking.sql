define claim_number='69997543'

select *
from clm_claim_tracking
where claim_uuid in
    (select distinct claim_uuid
     from clm_claim_tracking
     where 1=1
		  and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
		  and ('&&source_identifier' is null or '&&source_identifier' is not null and '&&source_identifier' = source_identifier)
		  and ('&&event_actor' is null or '&&event_actor' is not null and '&&event_actor' = event_actor)
			and ('&&subscriber_first_name' is null or '&&subscriber_first_name' is not null and upper('&&subscriber_first_name') = upper(subscriber_first_name))
			and ('&&subscriber_last_name' is null or '&&subscriber_last_name' is not null and upper('&&subscriber_last_name') = upper(subscriber_last_name))
		  and bussegment_vc = nvl('&&bussegment_vc', bussegment_vc)
		  and event_time > trunc(sysdate - nvl('&&days', 9999))
) order by event_time desc;

