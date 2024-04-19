select
        min(this_.RECEIVED_DATE) as rcvd_date,
        count(distinct this_.WIP_CLAIM_ID) as quantity,
        this_.BUSINESS_SEGMENT_VC as business_segment_vc,
        this_.CLAIM_TYPE_ID as claim_type_id
    from
        CLM_WIP_CLAIM this_
    where 1=1
-- 		and business_segment_vc = 55351
        and this_.WIP_CLAIM_ID in (select
distinct workflowpa1_.CLIENT_PAYLOAD_ID as y0_
from
                WH_TASK task_
inner join
                WH_PAYLOAD workflowpa1_
                    on task_.TASK_PAYLOAD_ID=workflowpa1_.WORKFLOW_PAYLOAD_ID
where
                task_.STATUS in (
                    'Ready'
                )
                and task_.NAME='WipClaim.RepairClaim'
                and workflowpa1_.CLIENT_PAYLOAD_TYPE='WipClaim'
                and task_.NAME in (
                    select
                        distinct role_.TASK_NAME as y0_
                    from
                        WH_TASK_ROLE role_
                    where
                        role_.ROLE_NAME in (
                            'Suspend Analyst'
                        )
                )
            )
        group by
            BUSINESS_SEGMENT_VC,
            CLAIM_TYPE_ID
         order by rcvd_date;
