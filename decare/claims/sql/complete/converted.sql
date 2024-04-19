SELECT *
FROM &&sot..CLM_CLAIM
where claim_source_identifier like '%&&clear_claim_number'
and upd_date > trunc(sysdate - &&days)
