select * from clm_claim_routing where claim_number in (select claim_number from SOT15.PAY_CLAIM
where pay_claim_id in (select pay_claim_id from SOT15.pay_detail
where bulk_id in (
SELECT bulk_id
FROM SOT15.PAY_BULK
WHERE PAYMENT_REFERENCE = '1295')))
