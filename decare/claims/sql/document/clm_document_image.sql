select *
from SOT01.CLM_DOCUMENT_IMAGE
where 1=1
and ('&&document_number' is null or '&&document_number' is not null and '&&document_number' = document_number)
and ('&&batch_number' is null or '&&batch_number' is not null and '&&batch_number' = batch_number)
and ('&&scan_date' is null or '&&scan_date' is not null and '&&scan_date' = scan_date) -- 26-Sep-2019
and ('&&external_id' is null or '&&external_id' is not null and '&&external_id' = external_id)
--and upd_user = 'gfallon'
--and upd_prgm = 'ClaimDocumentScheduler'
and ins_date > trunc(sysdate - nvl('&&days', 9999))
order by 1 desc;
