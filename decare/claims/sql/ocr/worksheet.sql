
select ecs_claim_hdr_id, ins_date, file_name
from clm_ecs_claim_hdr
where submitter_org_name = 'ANTHEM DNTL OCR';

select * from clm_claim_routing
where claim_submission_source='OCR'
and received_date >= trunc(sysdate - 3)
order by bussegment_vc desc, claim_number desc;

-- OPSDD
select claim_uuid, ecs.*
from clm_ecs_claim ecs
where ecs_claim_hdr_id=23709597
order by ins_date desc;

select claim_submission_source, claim_uuid, claim_number, event_name, event_time 
from clm_claim_routing
where claim_uuid in (select claim_uuid from clm_ecs_claim ecs where ecs_claim_hdr_id=23709597)
order by claim_number;

select info.PWK_ATTACHMENT_CONTROL_NO, patient_first_name, patient_last_name, patient_date_of_birth, prov.tin, prov.last_name as provider_last_name, receive_date
from clm_ecs_claim ecs, SOT01.CLM_ECS_INFORMATION   info, SOT01.CLM_ECS_CLAIM_PROVIDER prov
where ecs.ecs_claim_id = info.ecs_claim_id
and ecs.ecs_claim_id = prov.ecs_claim_id
and ecs.ecs_claim_id in (33190334)
order by PWK_ATTACHMENT_CONTROL_NO;

-- OPSID follows

select * from clm_wip_claim
where claim_uuid in ('14b81bf5-fcba-4bb9-9e3c-6644ff1187eb','f08f0fcf-0f10-48a4-8d6e-28c1d6752f50','4dabb283-ed35-4262-af92-d8634c20b92c','ad4905df-3701-4694-a076-3ba34cfc74e0')
order by claim_number;

select claim_number, primary_suspend_code from clm_wip_claim
where claim_number in ('58664519','58664800','58664822','58664825')
order by claim_number;

select * from sot22.clm_claim
where claim_uuid in ('14b81bf5-fcba-4bb9-9e3c-6644ff1187eb','f08f0fcf-0f10-48a4-8d6e-28c1d6752f50','4dabb283-ed35-4262-af92-d8634c20b92c','ad4905df-3701-4694-a076-3ba34cfc74e0')
order by claim_number;

update clm_ecs_claim set transaction_status_ind=null, upd_user='dwyttenb', upd_date=sysdate, upd_prgm='SQL' 
where claim_uuid in ('14b81bf5-fcba-4bb9-9e3c-6644ff1187eb','f08f0fcf-0f10-48a4-8d6e-28c1d6752f50','4dabb283-ed35-4262-af92-d8634c20b92c','ad4905df-3701-4694-a076-3ba34cfc74e0');

commit;

select
    submitter_name,
    transaction_status_ind,
    upd_user, upd_prgm,
    upd_date,
    ecs_claim_id,
    claim_uuid
from
    clm_ecs_claim
where
   ecs_claim_hdr_id = 26507409
   and submitter_name = 'ANTHEM DNTL OCR';

https://bamboo.decaresystems.ie/browse/DDSCLMDP-DEF148/latest

https://bamboo.decaresystems.ie/browse/DDSCLMWP-DEF152/latest