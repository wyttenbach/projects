select a.document_name as attachment_maybe, c.*
from clm_wcs_claim c, clm_wcs_claim_attachment a
where
c.wcs_claim_id = a.wcs_claim_id(+)
and c.wcs_claim_id in
    (select source_identifier
     from clm_claim_routing
     where
       claim_submission_source = 'WEB'
              and claim_number like '%&&claim_number'
              and source_identifier like '%&&wcs_claim_id')
order by c.ins_date desc
