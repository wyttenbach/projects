select *
from clm_wip_claim
where 1=1
and transmission_status_ind = 'P'
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
order by ins_date desc
