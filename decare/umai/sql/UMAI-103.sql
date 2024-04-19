SELECT
    xray, count(*)
FROM
    sot01.clm_entry_claim
where ins_date > sysdate - 60
GROUP BY xray;

select xray_ind from clm_document_image
where document_number = '000018046994';