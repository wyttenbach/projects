SELECT
 claim_number, check_number, check_amount, issue_date, provider_tin
FROM
    sot23.clm_doc_ref
WHERE
    check_number = '292826';

SELECT
 claim_number, check_number, check_amount, issue_date, provider_tin
FROM
    sot23.mf_pay_eob
WHERE
    check_number = '292826';

-- ================================================================ OPSSF 14-Jun-2021

select * from sot23.pay_eob
where claim_number in (57765976, 57766017, 57766055)  
order by claim_number;

select * from sot23.clm_doc_ref
where claim_number in (57765976, 57766017, 57766055)  
order by claim_number;

select print_file_id from drs_document
where business_identifier in ('f7dcb6e5-c325-45dd-afc5-48d885c991b7','5e7764fa-99b8-467a-bc4a-dda318c51ffd','5e7764fa-99b8-467a-bc4a-dda318c51ffd','86ba59fa-1942-47b5-9f2a-4b7a48ffa7f5','46da65bb-70c7-4b38-a952-32c24ba6afcc','5e7764fa-99b8-467a-bc4a-dda318c51ffd'
);
