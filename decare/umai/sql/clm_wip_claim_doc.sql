-- these are the clearing house document references
select *
from sot01.clm_wip_claim_doc
where ins_date > trunc(sysdate - 100)    
order by ins_date desc;
