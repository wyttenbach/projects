select distinct r.claim_number, r.claim_version, r.destination, r.document_type, r.document_uuid, r.language_id,
f.file_location, f.file_name,
d.print_file_start_page, d.print_file_end_page, d.ins_date, d.cms_name, d.upd_date
from sot23.clm_doc_ref r, sot01.drs_document d, sot01.drs_print_file f
where r.document_uuid = d.business_identifier(+)
and d.print_file_id = f.print_file_id
-- watermark problem 12/29/20
and document_uuid in ('3dd7d0ba-569d-44b0-94fc-fd7dd601929d','5787b1cd-6bd1-4377-9b15-bac661fff2a8')
order by claim_number, destination
--order by d.ins_date desc
