select * from sot23.clm_claim
where patient_first_name is null
and patient_last_name is null
and patient_date_of_birth is null
order by 1 desc;
