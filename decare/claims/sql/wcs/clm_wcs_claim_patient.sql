select *
from clm_wcs_claim 
where 1=1
and upper(patient_first_name) like upper('%&&patient_first_name')
and upper(patient_last_name) like upper('%&&patient_last_name')
order by ins_date desc
