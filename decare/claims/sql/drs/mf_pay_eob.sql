select EOB_DOCUMENT_ID, PROVIDER_TIN, CLAIM_NUMBER, CLAIM_VERSION, SUBSCRIBER_LAST_NAME, CHECK_NUMBER, CHECK_AMOUNT, PAYEE_TYPE, PAYEE_NAME, INS_DATE
from sot23.mf_pay_eob
where 1=1
and EOB_INSTRUCTION = 'PAPER'
and EOB_DESTINATION = 'SUBSCRIBER'
-- and TYPE_OF_PAYMENT = 'CHECK'
-- and trunc(ins_date) > '21-Aug-2014'
-- and trunc(ins_date) < '28-Aug-2014'
and ('&&claim_number' is null or claim_number = '&&claim_number')
order by eob_document_id
-- HORIZ claim number 151284564 NO outputdocs in CRM
-- WLPT claim number 2544964 identifier 312862835 outputdocs in CRM
