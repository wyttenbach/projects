select distinct r.claim_number, r.claim_version, r.destination, r.document_type, r.document_uuid, r.language_id,
f.file_location, f.file_name,
d.print_file_start_page, d.print_file_end_page, d.ins_date, d.cms_name, d.upd_date
from &&sot..clm_doc_ref r, sot01.drs_document d, sot01.drs_print_file f
where r.document_uuid = d.business_identifier(+)
and d.print_file_id = f.print_file_id
and ('&&claim_number' is null or '&&claim_number' = claim_number)
and ('&&document_type' is null or '&&document_type' = document_type)
and ('&&document_uuid' is null or '&&document_uuid' = document_uuid)
and ('&&print_file_id' is null or '&&print_file_id' = d.print_file_id)
and ('&&print_file_name' is null or '&&print_file_name' = f.file_name)
and ('&&document_id' is null or '&&document_id' = document_id)
and ('&&ins_prgm' is null or d.ins_prgm like '&&ins_prgm%')
and ('&&days' is null or r.ins_date > trunc(sysdate - '&&days'))
-- dhinsz 3/26/18
--and claim_number in ('28890124', '28890045', '28890136')
order by to_number(claim_number) desc, destination
--order by d.ins_date desc
