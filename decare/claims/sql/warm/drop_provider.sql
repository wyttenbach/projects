-- drop table provider;
-- drop table prov_matching_snapshot;
-- drop table prov_hiscrchk_snapshot;
-- drop table prov_pricing_snapshot;
-- drop table prov_license_snapshot;
-- drop table tin_key;
-- drop table license_key;
-- drop table clinic_npi_key;
-- drop table corporate_npi_key;
-- drop table individual_npi_key;
-- drop table tier_factor;
-- drop table tier_factor_snapshot;
-- drop table network_grouping;

create table prov_matching_snapshot as select sysdate as now from dual;
create table prov_pricing_snapshot as select sysdate as now from dual;
commit;

select * from provider;
select * from prov_matching_snapshot;
select * from prov_hiscrchk_snapshot;
select * from prov_pricing_snapshot;
select * from prov_license_snapshot;
select * from tin_key;
select * from license_key;
select * from clinic_npi_key;
select * from corporate_npi_key;
select * from individual_npi_key;
select * from tier_factor;
select * from tier_factor_snapshot;
select * from network_grouping;

select * from prov_license_snapshot
where license = 'D10162'
and state=27;

select * from prov_matching_snapshot
where identifier='UNBRANDED-430720-393302';

