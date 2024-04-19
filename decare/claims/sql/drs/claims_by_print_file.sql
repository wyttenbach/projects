select r.claim_number, r.destination, d.business_type, r.subscriber_last_name, d.print_file_start_page, d.print_file_end_page,
p.file_location, p.file_name, d.business_identifier
from &&sot..clm_doc_ref r, sot01.drs_document d, sot01.drs_print_file p
where r.document_uuid = d.business_identifier
and d.print_file_id = p.print_file_id
and ('&&print_file_id' is null or '&&print_file_id' is not null and '&&print_file_id' = p.print_file_id)
and ('&&print_file_name' is null or '&&print_file_name' is not null and '&&print_file_name' = p.file_name)
and ('&&print_file_start_page' is null or '&&print_file_start_page' is not null and '&&print_file_start_page' = d.print_file_start_page)
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = r.claim_number)
and ('&&days' is null or p.ins_date > trunc(sysdate - '&&days'))
--order by claim_number
order by print_file_start_page;
