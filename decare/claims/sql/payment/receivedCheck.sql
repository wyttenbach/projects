select * from SOT15.CLM_FINANCIAL_TRANSACTION
where 1=1
--and ins_date < sysdate - 90
and         RECEIVED_CHECK_ID is not null
