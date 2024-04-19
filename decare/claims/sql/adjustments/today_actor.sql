select adj.document_number, clm.*
from clm_adj adj, clm_adj_claim clm
where clm.ins_date > trunc(sysdate - &&days)
and clm.ins_user like '%&&actor_name'
and clm.adj_id = adj.adj_id
order by clm.ins_date
