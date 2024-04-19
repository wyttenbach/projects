select eob_id, run_id, eob_document_id, eob_destination, claim_number, claim_version, claim_status, provider_tin, subscriber_alternate_id, patient_last_name, check_number, check_amount, payee_type, ins_date, stationery
from &sot..mf_pay_eob -- Example: Use 'sot23' for Horizon
where 1=1
--and claim_status='PRIMARY'
--and eob_document_id = &edi
--and eob_document_id in (12741,12744)
and claim_number = '&claim'
--and claim_number in ('130762008')
--and check_number = '&check'
--order by claim_number, eob_document_id
order by ins_date desc


