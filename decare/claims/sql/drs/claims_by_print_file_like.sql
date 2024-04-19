select r.claim_number, r.destination, d.business_type, r.subscriber_last_name, d.print_file_start_page, d.print_file_end_page,
p.file_location, p.file_name, d.business_identifier
from &&sot..clm_doc_ref r, sot01.drs_document d, sot01.drs_print_file p
where r.document_uuid = d.business_identifier
and d.print_file_id = p.print_file_id
and ('&&print_file_name_like' is null or '&&print_file_name_like' is not null and p.file_name like '&&print_file_name_like')
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = r.claim_number)
--and d.cms_name is not null
--order by claim_number
order by file_name, print_file_start_page;
