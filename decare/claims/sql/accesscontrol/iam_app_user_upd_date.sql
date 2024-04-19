select * from iam_app_user
where upd_date > trunc(sysdate - nvl('&&days', 1))
order by upd_date desc
