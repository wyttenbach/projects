update sot12.gim_contract
set upd_user='dwyttenb', upd_prgm = 'MNCLAIMS-5651', upd_date = sysdate, renewal_date = end_date + 1
where group_id in (select group_id from sot12.gim_group where group_number = '763745');
