SELECT *
FROM SOT13.ENR_DEPENDENT
WHERE subscriber_id = &&subscriber_id
UNION
SELECT *
FROM SOT15.ENR_DEPENDENT
WHERE subscriber_id = &&subscriber_id
UNION
SELECT *
FROM SOT22.ENR_DEPENDENT
WHERE subscriber_id = &&subscriber_id
UNION
SELECT *
FROM SOT23.ENR_DEPENDENT
WHERE subscriber_id = &&subscriber_id
UNION
SELECT *
FROM SOT24.ENR_DEPENDENT
WHERE subscriber_id = &&subscriber_id