update fnd_valid_code_child
set attribute_2_char='I', upd_user='dwyttenb',upd_date=sysdate,upd_prgm='SQL'
where valid_code_child_id in (
select distinct function_vc
from SOT01.FND_FUNCTIONAL_MATRIX
where application_context = '/claimsweb');
commit;
