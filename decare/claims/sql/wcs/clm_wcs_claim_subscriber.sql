select *
from clm_wcs_claim c, clm_wcs_claim_subscriber s
where c.wcs_claim_id = s.wcs_claim_id
and upper(first_name) like upper('%&&first_name')
and upper(last_name) like upper('%&&last_name')
order by c.ins_date desc
