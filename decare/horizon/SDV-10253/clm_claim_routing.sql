select * from clm_claim_routing
where claim_number='79999013'; 
-- above claim number is from p.first_name is null and p.last_name is not null on opsdd
--and claim_uuid='403cc97c-f22c-4930-82b6-c1c500206954';
--and claim_number = '66657474'; 
-- opssf 21 Mar 2023 routing_id=66580539 claim_uuid=403cc97c-f22c-4930-82b6-c1c500206954 bussegment_vc=47871
-- opsdd 21 Mar 2023 routing_id=63163691 claim_uuid=07be789d-a4f7-4762-afcb-8c185f9c2fab bussegment_vc=33429
-- opsdd tin, license, npi 199917038	22DI01767500	1548476021
-- opsdd claim_number 69779277

select c.claim_number, c.claim_version, p.*
from sot23.clm_claim_provider p, sot23.clm_claim c
where c.claim_id = p.claim_id
--and claim_uuid='403cc97c-f22c-4930-82b6-c1c500206954';
--and p.last_name='HOLDEN';
and p.first_name is null and p.last_name is not null
order by length(claim_number) desc, claim_number desc, claim_version desc;

select owner, table_name, column_name from all_tab_columns
where table_name like 'HPP%'
and column_name like '%TIN%'
order by table_name, column_name;

select * from sot23.HPP_ORGANIZATION
where tin='819299423';