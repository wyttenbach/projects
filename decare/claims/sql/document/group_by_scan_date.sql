select scan_date, count(distinct(batch_number)) as batch_count, count(*) as document_count
from clm_document_image
where 1=1
and ins_date > trunc(sysdate - nvl('&&days', 9999))
group by scan_date
order by scan_date desc;

