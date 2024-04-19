select claim.BUSINESS_SEGMENT_VC, sub.subscriber_type_ind, sub.identifier, sub.last_name, CLAIM_UUID, CLAIM_NUMBER, CLAIM_SOURCE_IDENTIFIER, CLAIM_SUBMISSION_SOURCE, claim.ins_date
from SOT01.CLM_WIP_CLAIM claim
inner join SOT01.CLM_WIP_CLAIM_SUBSCRIBER sub
on claim.wip_claim_id=sub.wip_claim_id
where 1=1
and claim.ins_date > sysdate - 14
--and sub.subscriber_type_ind in ('M','S')
--and claim_source_name not like 'MAINFRAME%'
--and business_segment_vc is null
order by claim.ins_date --desc
