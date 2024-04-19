select SQL_ID, OPTIMIZER_COST, executions, round(ELAPSED_TIME/EXECUTIONS/1000/1000) as seconds_per_execution, LAST_ACTIVE_TIME, SQL_FULLTEXT
from v$sqlarea
where SQL_FULLTEXT like '%CLM_DOCUMENT_IMAGE%'
and executions > 0
and module = 'JDBC Thin Client'
ORDER BY seconds_per_execution DESC;
