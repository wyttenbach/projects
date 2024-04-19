-- NOTE NOTE NOTE NOTE
-- Bins are empty after a db refresh
-- NOTE NOTE NOTE NOTE

select
 *        from
            CLM_DOCUMENT_IMAGE this_
        where 1=1
 --           this_.BUSINESS_SEGMENT_VC in (
 --               411,413,33429
 --           )
 --           and this_.CLAIM_TYPE_ID=?
    --        and this_.PRIORITY_TYPE=?
            and this_.DOCUMENT_IMAGE_ID in (
                /* criteria query */ select
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
              --      and task_.NAME=?
     --               and workflowpa1_.CLIENT_PAYLOAD_TYPE=?
                    and task_.NAME in (
                        /* criteria query */ select
                            distinct role_.TASK_NAME as y0_
                        from
                            WH_TASK_ROLE role_
                        where
                            role_.ROLE_NAME in (
                                'Adjustment Analyst'
                            )
                    )
                )
            order by
                this_.RCVD_DATE asc,
                this_.DOCUMENT_IMAGE_ID asc
