select * from &&sot..pay_eob
where 1=1
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&eob_document_id' is null or '&&eob_document_id' is not null and '&&eob_document_id' = eob_document_id)
-- pdevlin 12/11/18
--and claim_number in ('33986183', '33986206', '33986111', '33986271')
--35f67408-770d-432a-ae99-e1cc3bb67fbd
--and stationery = 'HZN12PT'
--and TO_CHAR(issue_DATE, 'YYYY/MM/DD') = '2017/01/10'
--AND PAYEE_TYPE = 'SUBSCRIBER_ENR'
