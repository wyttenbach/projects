define alt_id='152W11168'
define alt_id='043M70727'
define alt_id='762W04348' -- DERMISHKOVA

select r.subscriber_id, r.identifier, r.alt_id, r.last_name, cov.base_contract_code, cov.pass3_contract_code, cov.begin_date, cov.end_date, cov.ins_date, cov.upd_date
from fnd_sub_coverage_routing r
join sot22.enr_coverage cov on r.subscriber_id = cov.subscriber_id
where alt_id = '&&alt_id'
and cov.end_date is null;

-- sot22
ALTER TRIGGER SOT22.ENR_COVERAGE_TRG4 DISABLE; 

-- cus_sot22
update sot22.enr_coverage
set base_contract_code='669H', pass3_contract_code='669H', upd_user='dwyttenb', upd_date=sysdate, upd_prgm='SQL'
where subscriber_id=63544987;

commit;

-- sot22
ALTER TRIGGER SOT22.ENR_COVERAGE_TRG4 ENABLE; 

--[10:05 AM] Michal Bali
--one option is to use the screens - just open up that subscriber, fill in action 'ADD' and some doc number and hit save
--
--[10:06 AM] Michal Bali
--alternatively use sot01.fnd_enqueue_pkg to send the message manually



select * from clm_claim_routing
where subscriber_identifier in ('660423022','762W04348')
and patient_first_name='MARIA'
order by 1 desc;
