select * from sot23.clm_claim
where claim_number='77262200';

select * from sot23.clm_claim
where subscriber_alt_identifier='3HZN42260100' or subscriber_identifier='141523267'
order by 1 desc;

select * from clm_claim_routing
where claim_number='77262200'; 
