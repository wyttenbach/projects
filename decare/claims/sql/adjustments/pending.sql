select ADJ_CLAIM_ID, CLAIM_UUID, CLAIM_NUMBER, CLAIM_VERSION, BUSINESS_SEGMENT_VC, ADJ_ID, ADJ_CLAIM_STATUS, TRANSMISSION_STATUS_IND, INS_DATE, INS_USER, UPD_DATE, UPD_USER
from clm_adj_claim
where 1=1
and transmission_status_ind = 'P'
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
order by ins_date desc

