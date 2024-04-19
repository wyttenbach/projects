select trigger_name from all_triggers
where trigger_name like '%_EDC';

select text from all_source where name ='NETWORK_CLINIC_PROVIDER_EDC' and type ='TRIGGER';