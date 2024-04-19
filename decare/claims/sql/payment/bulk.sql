select bulk_id, amount from sot15.pay_bulk where bulk_id in
	(select bulk_id from sot15.pay_detail where claim_id in
		(select claim_id from sot15.pay_claim where claim_number = &&1))
