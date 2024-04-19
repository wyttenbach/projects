select * from iam_app_user
where source_identifier like '%OU=DSI%'
and end_date is null;