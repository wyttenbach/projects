-- opssf
select * from sot23.clm_claim
where claim_number in (64151470, 67536305, 73551454, 73910672);
-- Note that the portal calls these Claim ID's, which is confusing

select * from sot23.clm_claim
where claim_number = '73551454'
order by 1;

select * from SOT23.clm_doc_ref
where claim_number = '73551454'
order by 1;