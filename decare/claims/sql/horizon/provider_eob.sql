select eob_document_id, count(claim_number), max(ins_date), sum(check_amount)
from &sot..mf_pay_eob -- Example: Use 'sot23' for Horizon
where eob_destination = 'PROVIDER'
having count(claim_number) > 1
group by eob_document_id
order by max(ins_date) desc


