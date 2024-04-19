select count(distinct(document_uuid))
from sot23.clm_doc_ref r, sot01.drs_document d, sot01.drs_print_file p
where r.document_uuid = d.business_identifier
and d.print_file_id = p.print_file_id
and p.file_location = '/test_pres_archive/'
and document_type='EOB'
and destination='SUBSCRIBER'
--and r.ins_date > '01-Jan-2019'
--and rownum < 10


