select r.eob_document_id, r.claim_number, r.eob_destination, r.subscriber_last_name, d.*
from sot01.drs_document d, sot23.mf_pay_eob r
where to_char(r.eob_document_id) = d.business_identifier--(+)
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = r.claim_number)
and r.ins_date > trunc(to_date('29-Aug-2015') - nvl('&&days', 7))
and r.ins_date < '29-Aug-2015' -- Horizon conversion date
order by r.ins_date
