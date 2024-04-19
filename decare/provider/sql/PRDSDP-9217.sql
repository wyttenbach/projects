SELECT * FROM ANTHEM.provider
where TIN='411400205';

SELECT * FROM ANTHEM.clinic
where COMMON_NAME='RONALD K LEACH';

SELECT * FROM ANTHEM.network_clinic_provider
where clinic_id=523403;

SELECT * FROM ANTHEM.provider where id=365393;

select * from anthem_jn.clinic where id=523403;

select journal_id, tin, data_owner_id, change, changed_at, comments, os_user from anthem_jn.export_835_rules 
where change <> 'I'
order by 1 desc;

select * from export_835_rules where tin='411400205';

select * from export_835_rules where tin='550943928';

select * from export_835_rules where tin='010720632';

select * from anthem_jn.export_835_rules where tin='411400205';

select * from anthem_jn.export_835_rules where tin='550943928';

select * from anthem_jn.export_835_rules where tin='232582909';

update export_835_rules set npi='ab94482' where tin='411400205' and npi='1780794792';

update export_835_rules set npi='1780794792' where tin='411400205' and npi='ab94482';

commit;
