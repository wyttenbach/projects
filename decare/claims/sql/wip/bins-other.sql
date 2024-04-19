select
            clmsuspend0_.SUSPEND_TYPE_VC as col_0_0_,
            min(clmsuspend0_.RCVD_DATE) as col_1_0_,
            count(*) as col_2_0_
        from
            CLM_SUSPENDED_TASK clmsuspend0_
        where
            clmsuspend0_.TASK_STATUS_VC=38262
            and clmsuspend0_.BUSINESS_SEGMENT_VC=2
 --           and clmsuspend0_.CUSTOMER_NUMBER=''
 --           and clmsuspend0_.GROUP_NUMBER=''
        group by
            clmsuspend0_.SUSPEND_TYPE_VC
