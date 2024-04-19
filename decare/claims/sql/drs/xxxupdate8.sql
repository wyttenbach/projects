set timing off

select '&&1 ' || to_char(sysdate,'HH24.MI.SS') as target_and_started from dual;

set timing on
update sot01.drs_document
set business_identifier = 'xxx' || business_identifier,
upd_date=sysdate,
upd_user=user,
upd_prgm='xxxupdate8.sql'
where trunc(ins_date) = '&&1';

commit;
