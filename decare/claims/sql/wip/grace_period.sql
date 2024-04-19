select * from CLM_WIP_GRACE_PERIOD_OUTPUT
where ins_date > trunc(sysdate - &&days)
and claim_number like '%&&claim_number'
order by ins_date desc
