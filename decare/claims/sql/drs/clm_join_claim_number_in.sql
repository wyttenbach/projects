select r.claim_number, r.destination, d.business_type, d.business_identifier, d.cms_name, d.print_file_start_page, d.print_file_end_page, f.file_location, f.file_name
from &&sot..clm_doc_ref r, sot01.drs_document d, sot01.drs_print_file f
where 1=1
and r.document_uuid = d.business_identifier(+)
and d.print_file_id = f.print_file_id
and claim_number in ('25395088', '25395046', '25395055', '25395039', '25395023', '25394185')  
order by claim_number, destination, business_type
