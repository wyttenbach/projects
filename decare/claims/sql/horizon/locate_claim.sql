select pf.file_name print_file_name, doc.*
from sot01.drs_print_file pf, sot01.drs_document doc
where business_identifier in
	(select eob_document_id
		from &sot..mf_pay_eob -- Example: Use 'sot23' for Horizon
		where 1=1
		and claim_number like '&claim'
--		and claim_number in ('130591130','130639500')
	)
and pf.print_file_id = doc.print_file_id
