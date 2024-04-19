-- cus_sot01
update fnd_pid_recalc_run_ctl set PROCESSED_IND='N', UPD_PRGM='SQL', UPD_USER='dwyttenb', UPD_DATE=sysdate;
commit;

-- sot01
CREATE TABLE dwyttenb
  AS (SELECT distinct subgroup_id from sot01.fnd_pid_recalc_run_ctl);
grant select, insert, update, delete on sot01.dwyttenb to cus_sot22;
commit;

-- cus_sot22
SELECT distinct subgroup_id from sot01.dwyttenb;
update sot22.gim_product_id
set UPD_PRGM='SQL', UPD_USER='dwyttenb', UPD_DATE=sysdate, deductible=null
where subgroup_id in (SELECT distinct subgroup_id from sot01.dwyttenb);
commit;

-- 0000524029
update sot22.gim_product_id
set UPD_PRGM='SQL', UPD_USER='dwyttenb', UPD_DATE=sysdate, deductible=null
where customer_id in (SELECT customer_id from sot22.gim_customer where customer_number='0000979359');
commit;

select * from sot22.gim_product_id
where customer_id in (SELECT customer_id from sot22.gim_customer where customer_number='0000979359');
