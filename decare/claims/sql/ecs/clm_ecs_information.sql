select length(PWK_ATTACHMENT_CONTROL_NO), count(*)
from SOT01.CLM_ECS_INFORMATION   info
group by rollup(length(PWK_ATTACHMENT_CONTROL_NO))
order by 1 desc
