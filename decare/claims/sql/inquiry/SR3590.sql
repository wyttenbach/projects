SELECT sub.*, cus.customer_number, cus.NAME
FROM CLM_CLAIM_NON_ENR_SUBSCRIBER sub, SOT15.GIM_CUSTOMER cus
where sub.customer_id = cus.customer_id
order by sub.last_name
