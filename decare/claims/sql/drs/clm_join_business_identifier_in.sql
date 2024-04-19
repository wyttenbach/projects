select r.claim_number, r.destination, d.business_type, d.business_identifier, d.cms_name, d.print_file_start_page, d.print_file_end_page, f.file_location, f.file_name
from sot23.clm_doc_ref r, sot01.drs_document d, sot01.drs_print_file f
where 1=1
and r.document_uuid = d.business_identifier(+)
and d.print_file_id = f.print_file_id
and business_identifier in ('2102d48f-a0c0-4b7d-a7b6-407fa13d6f76', '0c4e9362-49dd-4c75-afe1-4c20a34f0a34', 'a5bcce46-3de3-43b9-ad89-d765a668d226', 'bc421c4a-f3e8-431e-99bc-7e10d234a511')
order by claim_number, destination, business_type
