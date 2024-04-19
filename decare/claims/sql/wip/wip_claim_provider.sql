select * from clm_wip_claim c, clm_wip_claim_provider p
where c.wip_claim_id = p.wip_claim_id
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
and ('&&business_segment_vc' is null or '&&business_segment_vc' is not null and '&&business_segment_vc' = business_segment_vc)
and ('&&primary_suspend_code' is null or '&&primary_suspend_code' is not null and '&&primary_suspend_code' = primary_suspend_code)
and c.ins_date > trunc(sysdate - nvl('&&days', 9999))

-- vigesh PRDSDC-9846 grace period letters
--and claim_number in ('41757861','41719033','41637340','41398303','41398280','41398283','41383992','40581050')
--and p.first_name is null
