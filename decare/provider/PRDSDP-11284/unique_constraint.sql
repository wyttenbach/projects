SELECT *
FROM all_indexes
WHERE owner='ANTHEM'
and index_name = 'UIX_CLINIC_PROV_PROVIDER';

SELECT i.index_name, a.*, c.column_name, ie.column_expression 
FROM all_tables a
JOIN all_indexes i on i.table_name = a.table_name
JOIN all_ind_columns c ON i.index_name = c.index_name
LEFT OUTER JOIN all_ind_expressions ie ON ie.index_name = c.index_name
WHERE 1=1 --upper(a.table_name) = upper('&&table_name')
and a.owner='ANTHEM'
and a.table_name='CLINIC_PROVIDER'
and i.index_name='UIX_CLINIC_PROV_PROVIDER'
ORDER BY a.owner, i.index_name, a.table_name, c.column_name;

select provider_id from clinic_provider
where clinic_id=493875
order by provider_id

