
-- Statement updates 1 row
update SOT01.FND_FUNCTIONAL_MATRIX
set function_order = 2, upd_user='dwyttenb', upd_date=sysdate, upd_prgm='SQL'
where function_vc = 3008 and function_order != 2;

-- Statement updates 1 row
update SOT01.FND_FUNCTIONAL_MATRIX
set function_order = 4, upd_user='dwyttenb', upd_date=sysdate, upd_prgm='SQL'
where function_vc = 3011 and function_order != 4;

commit;
