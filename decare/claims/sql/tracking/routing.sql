select *
from CLM_CLAIM_ROUTING
where 1=1
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
and ('&&source_identifier' is null or '&&source_identifier' is not null and '&&source_identifier' = source_identifier)
and ('&&subscriber_identifier' is null or '&&subscriber_identifier' is not null and '&&subscriber_identifier' = subscriber_identifier)
and ('&&subscriber_first_name' is null or '&&subscriber_first_name' is not null and upper('&&subscriber_first_name') = upper(subscriber_first_name))
and ('&&subscriber_last_name' is null or '&&subscriber_last_name' is not null and upper('&&subscriber_last_name') = upper(subscriber_last_name))
and event_time > trunc(sysdate - nvl('&&days', 9999))
order by event_time desc;
