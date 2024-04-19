select a.document_name as attachment_maybe, c.*
from clm_wcs_claim c, clm_wcs_claim_attachment a
where
c.wcs_claim_id = a.wcs_claim_id(+)
and c.wcs_claim_id = &&wcs_claim_id
order by c.ins_date desc
