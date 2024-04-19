select distinct owner from all_tables
order by owner;

select table_name from all_tables
where owner='ANTHEM_JN'
order by table_name;

select * from anthem_jn.export_835_rules
where tin='325461280';

select * from anthem.export_835_rules
where tin='325461280';