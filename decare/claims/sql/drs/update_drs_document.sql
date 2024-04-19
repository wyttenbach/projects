set timing on
update sot01.drs_document
set cms_name=null,
upd_date=sysdate,
upd_user='dwyttenb',
upd_prgm='update_drs_document.sql'
where print_file_id = &&print_file_id
and cms_name is not null;
--commit;
