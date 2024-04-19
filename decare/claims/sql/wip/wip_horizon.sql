select * from clm_wip_claim
where business_segment_vc = 47871
and claim_version > 0
--and subscriber_inc_identifier like '3HZN%'
order by ins_date;

-- this claim is broken because version 1 exists as both WIP and complete
select * from sot23.clm_claim
where claim_number='41643403';
