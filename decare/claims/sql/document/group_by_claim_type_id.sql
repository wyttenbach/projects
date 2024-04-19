select CLAIM_TYPE_ID, min(RCVD_DATE), count(*)
from SOT01.CLM_DOCUMENT_IMAGE
where business_segment_vc = &&business_segment_vc
group by claim_type_id
order by count(*) desc
