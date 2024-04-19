select transaction_status_ind, count(*), min(ins_date), max(ins_date), min(upd_date), max(upd_date)
from clm_ecs_claim ecs
where 1=1
and ecs.ins_date > trunc(sysdate - nvl('&&days', 0))
group by transaction_status_ind;
/*
 * R = Reject
 * 2016-05-06 09:09:03,395 [pool-45-thread-1]  INFO com.dds.claim.ecs.service.feeder.EcsFeederImpl - Rejecting ECS claim, source: 
 * com.dds.claim.ecs.domain.EcsClaimSource[sourceIdentifier=9273311,processDate=null], validation result: DefaultEcsValidationResult 
 * [type=REJECT, reports=[DefaultEcsValidationReport [message=Invalid ICD qualifier for this claim, type=REJECT, value=null]]]
 */