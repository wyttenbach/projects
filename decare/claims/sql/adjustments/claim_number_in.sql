select *
from CLM_ADJ_CLAIM
where claim_number in ('14140952','7861127','14175935','7294690','13069080','7607404')
--and adjustment_finished is null
order by business_segment_vc, claim_number, claim_version
