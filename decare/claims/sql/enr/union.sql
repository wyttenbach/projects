select * from
(SELECT 'NON13' as sot, d.first_name, d.date_of_birth
FROM SOT13.CLM_CLAIM_NON_ENR_DEPENDENT d
WHERE subscriber_id = &&subscriber_id
UNION
SELECT 'NON15' as sot, d.first_name, d.date_of_birth
FROM SOT15.CLM_CLAIM_NON_ENR_DEPENDENT d
WHERE subscriber_id = &&subscriber_id
UNION
SELECT 'NON22' as sot, d.first_name, d.date_of_birth
FROM SOT22.CLM_CLAIM_NON_ENR_DEPENDENT d
WHERE subscriber_id = &&subscriber_id
UNION
SELECT 'NON23' as sot, d.first_name, d.date_of_birth
FROM SOT23.CLM_CLAIM_NON_ENR_DEPENDENT d
WHERE subscriber_id = &&subscriber_id
UNION
SELECT 'NON24' as sot, d.first_name, d.date_of_birth
FROM SOT24.CLM_CLAIM_NON_ENR_DEPENDENT d
WHERE subscriber_id = &&subscriber_id
UNION
SELECT 'SOT13' as sot, d.first_name, d.date_of_birth
FROM SOT13.ENR_DEPENDENT d
WHERE subscriber_id = &&subscriber_id
UNION
SELECT 'SOT15' as sot, d.first_name, d.date_of_birth
FROM SOT15.ENR_DEPENDENT d
WHERE subscriber_id = &&subscriber_id
UNION
SELECT 'SOT22' as sot, d.first_name, d.date_of_birth
FROM SOT22.ENR_DEPENDENT d
WHERE subscriber_id = &&subscriber_id
UNION
SELECT 'SOT23' as sot, d.first_name, d.date_of_birth
FROM SOT23.ENR_DEPENDENT d
WHERE subscriber_id = &&subscriber_id
UNION
SELECT 'SOT24' as sot, d.first_name, d.date_of_birth
FROM SOT24.ENR_DEPENDENT d
WHERE subscriber_id = &&subscriber_id)
order by first_name, date_of_birth
