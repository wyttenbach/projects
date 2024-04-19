SELECT  DISTINCT CLMP_TOOTH
FROM CPH_CLMP
where 1=1
--and ins_date > trunc(sysdate - &&days)
--and upper(clmh_pat_name) like upper('%&&pat_name%')
