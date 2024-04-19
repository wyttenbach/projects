SELECT ins_user, count(*),min(ins_date),max(ins_date)
FROM FND_REPORT_QUEUE FRQ

--WHERE FRQ.INS_USER = '&&user'
group by ins_user
order by ins_user
