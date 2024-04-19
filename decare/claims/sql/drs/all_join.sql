SELECT e.claim_number, d.*, p.*
FROM &&sot..pay_eob e, sot01.drs_document d, sot01.drs_print_file p
WHERE d.print_file_id = p.print_file_id
AND e.EOB_DOCUMENT_ID = d.business_identifier
and e.completed_date is not null
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&days' is null or p.ins_date > trunc(sysdate - '&&days'))
-- Anne Kennedy OPSQ 1/24/2020
--and claim_number in ('43769823','43769601')
order by to_number(claim_number) desc
