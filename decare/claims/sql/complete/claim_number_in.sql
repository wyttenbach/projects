select * from (
select 'SOT13' as sot, c.claim_number, c.claim_version, claim_status, ins_date, upd_date
from sot13.clm_claim c
where claim_number in ('722747','845755','696598','123')
union
select 'SOT15' as sot, c.claim_number, c.claim_version, claim_status, ins_date, upd_date
from sot15.clm_claim c
where claim_number in ('722747','845755','696598','123')
union
select 'SOT22' as sot, c.claim_number, c.claim_version, claim_status, ins_date, upd_date
from sot22.clm_claim c
where claim_number in ('722747','845755','696598','123')
union
select 'SOT23' as sot, c.claim_number, c.claim_version, claim_status, ins_date, upd_date
from sot23.clm_claim c
where claim_number in ('722747','845755','696598','123')
union
select 'SOT24' as sot, c.claim_number, c.claim_version, claim_status, ins_date, upd_date
from sot24.clm_claim c
where claim_number in ('722747','845755','696598','123')
)
order by sot, claim_number, claim_version
