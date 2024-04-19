select 
  b.uniqueness, a.index_name, a.table_name, a.column_name
from 
  all_ind_columns a, all_indexes b
where
  a.index_name=b.index_name and
  a.table_name = upper('&&table_name') 
order by 
  a.table_name, a.index_name, a.column_position;

