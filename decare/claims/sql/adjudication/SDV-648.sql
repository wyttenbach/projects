select * from CLM_WIP_PRICING_QUERY
where provider_insurer_code is not null;

-- cus_sot01
update CLM_WIP_PRICING_QUERY 
set upd_user='dwyttenb', upd_prgm='SQLDeveloper', upd_date=sysdate, provider_insurer_code='dummy'
where claim_pricing_query_id=1601017;
commit;

select c.wip_claim_id, c.claim_number, c.claim_version, p.first_name, p.last_name, p.patient_id
from clm_wip_claim_line l, clm_wip_claim c, clm_wip_claim_patient p
where l.claim_pricing_query_id=1601017
and l.wip_claim_id=c.wip_claim_id
and p.wip_claim_id=c.wip_claim_id
order by 1;
-- 19139734 65153888 (HORIZ)

desc SOT22.CLM_CLAIM_PRICING_QUERY

select * from SOT22.CLM_CLAIM_PRICING_QUERY
where provider_insurer_code is not null;

select * from sot22.clm_claim_line l
where 1=1
and l.claim_pricing_query_id is not null;

select c.ins_date, c.claim_number, l.claim_pricing_query_id 
from sot22.clm_claim_line l, sot22.clm_claim c
where 1=1
and l.claim_pricing_query_id is not null
and l.claim_id=c.claim_id
order by c.claim_id desc;

select max(l.claim_id)
from sot22.clm_claim_line l
where l.claim_pricing_query_id is not null;
--75973059

select c.ins_date, c.claim_number, l.claim_pricing_query_id 
from sot22.clm_claim_line l, sot22.clm_claim c
where 1=1
and l.claim_id=c.claim_id
and l.claim_id=75973059;
-- 70672634

select * from SOT22.CLM_CLAIM_LINE
where claim_id=75973059;

select * from SOT22.CLM_CLAIM_PRICING_QUERY
where claim_pricing_query_id in (select l.claim_pricing_query_id 
from sot22.clm_claim_line l, sot22.clm_claim c
where 1=1
and l.claim_id=c.claim_id
and l.claim_id=75973059);

select c.claim_id, c.claim_number, q.* 
from sot22.clm_claim_line l, sot22.clm_claim c, sot22.clm_claim_pricing_query q
where l.claim_id=c.claim_id
and l.claim_pricing_query_id = q.claim_pricing_query_id
and c.claim_number in ('75265381','75265369','75265380','75265193','75265352','75265337','75265385','75265362','75265297','75265395','75265388','75265373','75265306','75265377','75265389','70490176','78695184','75265397','75265278','75265358');
-- 71759719 75265306	3185310276

-- cus_sot01
update SOT22.CLM_CLAIM_PRICING_QUERY 
set upd_user='dwyttenb', upd_prgm='SQLDeveloper', upd_date=sysdate, provider_insurer_code='dummy'
where claim_pricing_query_id=3185310276;
commit;

update SOT22.CLM_CLAIM_PRICING_QUERY 
set upd_user='dwyttenb', upd_prgm='SQLDeveloper', upd_date=sysdate, provider_insurer_code='dummy'
where claim_pricing_query_id in (select l.claim_pricing_query_id 
from sot22.clm_claim_line l, sot22.clm_claim c
where 1=1
and l.claim_id=c.claim_id
and l.claim_id=75973059);
commit;

select c.claim_number
from sot22.clm_claim c, sot22.clm_claim_provider p
where p.claim_id=c.claim_id
and p.provider_source='GRID'
order by c.ins_date desc
FETCH NEXT 10 ROWS ONLY;
-- 40 seconds
-- 70672634x
-- 73408216x
-- 75884130x
--75475770x
--77159143x
--72494410x
--70608309<-adjustment complete sot22 2023_02_07
--77375784
--74446987
--78286974

select c.claim_id, c.claim_number, c.claim_version, q.*
from sot22.clm_claim c, sot22.clm_claim_line l, sot22.clm_claim_pricing_query q
where c.claim_number='70608309' 
--and c.claim_version=1
and l.claim_id=c.claim_id
and l.claim_pricing_query_id = q.claim_pricing_query_id
