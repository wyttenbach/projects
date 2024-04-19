select * from iam_app_user
where ins_date > trunc(sysdate - nvl('&&days', 1))
order by ins_date desc
