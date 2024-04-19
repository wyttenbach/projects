select distinct specialty_no, specialty from SOT01.PRO_V_DIRECTORY_TBL
where specialty_no is not null
order by specialty_no
