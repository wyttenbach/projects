insert into fnd_pid_recalc_run_ctl (BUSINESS_SEGMENT_VC, SUBGROUP_ID, RECORD_TYPE_IND, PROCESSED_IND, INS_PRGM, INS_USER, INS_DATE) 
select BUSINESS_SEGMENT_VC, SUBGROUP_ID, 'S', 'N', 'SQL', 'dwyttenb', sysdate 
/* record_type_ind indicator S = subgroup row or A = all subgroups for business segment */
from SOT01.GIM_SUBGROUP_ROUTING 
where BUSINESS_SEGMENT_VC=33003;
/* DDNC => 2677 rows */
/* cus_sot01 gets ORA-01031: insufficient privileges */