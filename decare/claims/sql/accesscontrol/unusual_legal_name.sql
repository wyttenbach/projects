select * from iam_app_user
where 1=1
--and source_name like '%devad'
--and not regexp_like(source_identifier, 'OU=testUsers')
--and regexp_like(source_identifier, 'OU=Associates')
--and regexp_like(source_identifier, 'OU=nonAssociates')
and (length(legal_name) > 32
or NOT REGEXP_LIKE(legal_name, '^[A-Za-z,.'' -]*$'))
order by length(legal_name) desc;
