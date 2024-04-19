select c.*
from SOT01.CLM_ECS_CLAIM_HDR h, SOT01.CLM_ECS_CLAIM c
where h.ins_date > trunc(sysdate - &&days)
--to_char(h.INS_DATE, 'yyyymmdd') = '&&yyyymmdd'
and c.ECS_CLAIM_HDR_ID = h.ECS_CLAIM_HDR_ID(+)
order by c.ECS_CLAIM_HDR_ID, c.ECS_CLAIM_ID
-- see ecs-transaction-status.txt
