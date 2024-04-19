select l.proc_code, count(l.proc_code)
from sot01.clm_wip_claim c, sot01.clm_wip_claim_line l
where c.wip_claim_id = l.wip_claim_id
and c.primary_suspend_code >=700 and c.primary_suspend_code < 800
group by l.proc_code
order by count(l.proc_code) desc
