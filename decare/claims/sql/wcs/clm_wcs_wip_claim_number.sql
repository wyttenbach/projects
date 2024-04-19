select *
from clm_wcs_claim
where
  1=1 and
  wcs_claim_id in
    (select claim_source_identifier
     from clm_wip_claim
     where
       claim_submission_source = 'WEB' and
       claim_number = '&&claim_number')
order by ins_date desc
