select *
from sot22.clm_claim_patient_assoc
where dependent_id is null 
and claim_non_enr_dependent_id is null
and patient_is_subscriber_ind = 'N'
--and subscriber_id = 52927110
order by 1 desc