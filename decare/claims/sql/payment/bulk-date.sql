select * from sot15.pay_bulk
where ins_date > sysdate - 3
--and status = 'APPROVED'
--order by run_id, claim_number
