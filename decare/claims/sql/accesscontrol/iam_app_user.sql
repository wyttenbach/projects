select * from iam_app_user
where 1=1
and ('&&account_name' is null or '&&account_name' is not null and upper('&&account_name') = upper(account_name))
and ('&&first_name' is null or '&&first_name' is not null and upper('&&first_name') = upper(first_name))
and ('&&last_name' is null or '&&last_name' is not null and upper('&&last_name') = upper(last_name))
and ('&&source_name' is null or '&&source_name' is not null and upper('&&source_name') = upper(source_name))
order by source_name, account_name;
