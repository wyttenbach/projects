select trunc(ins_date, 'HH24'), count(*)
from clm_document_image
where ins_date > sysdate - 30
group by trunc(ins_date, 'HH24')
order by count(*) desc