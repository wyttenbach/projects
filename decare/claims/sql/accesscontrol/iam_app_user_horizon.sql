select source_name, source_identifier, account_name, legal_name, start_date, end_date
from iam_app_user
where upper(source_identifier) like '%OU=HORIZON%' 
and end_date is null
order by source_name, account_name;
