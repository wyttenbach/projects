select * from &&sot..clm_claim_non_enr_dependent
and ('&&business_segment_vc' is null or '&&business_segment_vc' is not null and &&business_segment_vc = business_segment_vc)
and ('&&identifier' is null or '&&identifier' is not null and upper('&&identifier') = upper(identifier))
and ('&&first_name' is null or '&&first_name' is not null and upper('&&first_name') = upper(first_name))
and ('&&last_name' is null or '&&last_name' is not null and upper('&&last_name') = upper(last_name))
 
