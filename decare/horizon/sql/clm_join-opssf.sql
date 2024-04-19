select distinct r.doc_ref_id, r.claim_number, r.claim_version, r.destination, r.document_type, r.check_number, r.provider_tin, r.document_uuid, r.language_id,
f.file_location, f.file_name,
d.print_file_start_page, d.print_file_end_page, d.ins_date, d.cms_name, d.upd_date
from sot23.clm_doc_ref r, sot01.drs_document d, sot01.drs_print_file f
where r.document_uuid = d.business_identifier(+)
and d.print_file_id = f.print_file_id
--and ('&&claim_number' is null or '&&claim_number' = claim_number)
and d.print_file_id=177694
order by d.ins_date desc
