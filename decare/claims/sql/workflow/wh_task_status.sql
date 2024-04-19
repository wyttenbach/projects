select name, status, count(*)
from GEN_WH_TASK
group by rollup(name, status);

