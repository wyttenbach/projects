select claim_status, count(*)
from clm_claim_routing
where claim_submission_source = 'ECS'
and bussegment_vc = nvl('&&bussegment_vc', bussegment_vc)
and event_time >= trunc(sysdate - 1)
group by rollup (claim_status);
