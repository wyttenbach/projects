SELECT *
FROM SOT01.CLM_ENTRY_SUBSCRIBER
WHERE INS_DATE > sysdate - &&days
order by ins_date desc
