select *
from fnd_report_queue
where upper(ins_user) like upper('%&&ins_user%')
order by ins_date desc
