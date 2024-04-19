SELECT sub.identifier, sub.first_name as first, sub.last_name as last, cus.NAME
FROM CLM_CLAIM_NON_ENR_SUBSCRIBER sub, GIM_CUSTOMER_ROUTING cus
where sub.customer_id = cus.customer_id
order by sub.last_name
