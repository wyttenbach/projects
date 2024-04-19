select ca.username, cas.transaction_type_id, cab.business_segment_vc, cac.claim_type_id, cct.name, cac.ins_date, cac.upd_date
from clm_access ca, clm_access_settings cas, clm_access_business_seg cab, clm_access_claim_type cac, clm_claim_type cct
where 1=1
and ca.access_id = cas.access_id
and cas.access_settings_id = cab.access_settings_id
and cab.access_business_seg_id = cac.access_business_seg_id
and cac.claim_type_id = cct.claim_type_id(+)
and ca.username like '%&&username'
order by ca.username, cas.transaction_type_id, cab.business_segment_vc, cac.claim_type_id
