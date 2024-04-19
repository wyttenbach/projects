select *
from clm_claim_tracking
where 1=1
  and event_time > trunc(sysdate - nvl('&&days', 0))
  and (nvl('&&event_actor', event_actor) = event_actor or '&&event_actor' is null and event_actor is null)
  and (nvl('&&claim_number', claim_number) = claim_number or '&&claim_number' is null and claim_number is null)
  and (nvl('&&claim_uuid', claim_uuid) = claim_uuid or '&&claim_uuid' is null and claim_uuid is null)
order by event_time desc

