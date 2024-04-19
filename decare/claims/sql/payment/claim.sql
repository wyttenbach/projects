select * from &&sot..pay_claim
where 1=1
--and pay_claim_id in (556241,556242)  
and claim_number like '%&&claim_number'
order by claim_number
