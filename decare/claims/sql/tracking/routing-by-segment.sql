select bussegment_vc, count(*)
from CLM_CLAIM_ROUTING
group by bussegment_vc
order by bussegment_vc;

select * from clm_claim_routing
where bussegment_vc=47871
order by 1 desc
FETCH NEXT 10 ROWS ONLY;
