select *
from CLM_CLAIM_ROUTING
-- jroquet's SNOW ticket INC2308048
--where claim_number in ('19052526', '19286568', '17674166', '18170995', '17674798', '19305105', '16635855')
-- akennedy qa
--where claim_number in ('19630141', '19722095', '19713517', '19714339', '19656134')
-- pdevlin ua 8/4/17
--where claim_number in ('24704428', '24704394', '24704398')
-- pdevlin qa WLPT 9/1/17
--where claim_number in ('25395088', '25395046', '25395055', '25395039', '25395023', '25394185')  
-- dhinsz 3/26/18
where claim_number in ('28890124', '28890045', '28890136')  

order by bussegment_vc, to_number(claim_number);
--order by event_time;
