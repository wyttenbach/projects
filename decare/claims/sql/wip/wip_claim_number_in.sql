select claim_uuid,claim_number, ins_date, primary_suspend_code, upd_date, upd_user, transmission_status_ind
from clm_wip_claim
-- akennedy qa
where claim_number in ('19630141', '19722095', '19713517', '19714339', '19656134')
order by claim_number
