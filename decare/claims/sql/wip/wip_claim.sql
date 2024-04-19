select * from clm_wip_claim
where 1=1
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
and ('&&business_segment_vc' is null or '&&business_segment_vc' is not null and '&&business_segment_vc' = business_segment_vc)
and ('&&primary_suspend_code' is null or '&&primary_suspend_code' is not null and '&&primary_suspend_code' = primary_suspend_code)
and ins_date > trunc(sysdate - nvl('&&days', 9999))    
order by ins_date desc
