select claim.claim_number, detail.* from sot15.pay_detail detail, sot15.pay_claim claim
where detail.pay_claim_id = claim.pay_claim_id
--and claim.status = 'EXECUTED'
and detail.ins_date > sysdate - 28
order by detail.bulk_id, detail.pay_claim_id
