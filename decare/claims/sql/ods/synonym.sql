select * from all_objects
where 1=1
and owner='CUS_SOT22'
and object_type='SYNONYM'
and object_name like 'CLM_CLAIM%'
order by 1,2
