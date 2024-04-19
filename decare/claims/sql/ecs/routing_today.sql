select trunc(received_date), count(*)
from clm_claim_routing
where claim_submission_source = 'ECS'
and claim_status in ('PROCESSED','DENIED','SUSPENDED')
and bussegment_vc = nvl('&&bussegment_vc', bussegment_vc)
and received_date >= trunc(sysdate - nvl('&&days', 0))
group by rollup(trunc(received_date))
order by trunc(received_date);
