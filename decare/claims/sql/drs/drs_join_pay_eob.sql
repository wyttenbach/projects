--
-- clm_join is 5-6 times faster!
--
select distinct eob.claim_number, doc.ins_date, doc.business_identifier, doc.business_type, doc.print_file_start_page, doc.print_file_end_page, doc.cms_name
from sot01.drs_document doc, &&sot..pay_eob eob
where eob.eob_document_id = doc.business_identifier
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
--and eob.claim_number in ('37418099')
order by eob.claim_number, doc.ins_date
