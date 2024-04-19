select * from sot12.gim_contract
where group_id in (select group_id from sot12.gim_group where group_number = '763745')
