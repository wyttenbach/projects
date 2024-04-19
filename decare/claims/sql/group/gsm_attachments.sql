select h.*, g.*
from &&sot..GSM_HEADER_CA h, &&sot..GSM_CUSTOMER_ATTACH_CA g
where g.header_ca_id = h.header_ca_id
and g.ins_date > trunc(sysdate - nvl('&&days', 9999))
and ('&&gsm_number' is null or '&&gsm_number' is not null and gsm_number like '%&&gsm_number')
--and gsm_number in ('0001592590','0001591819','0001591209')
order by g.ins_date -- not desc, to match ls -ltr for comparison purposes
