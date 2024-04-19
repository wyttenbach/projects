select * from (
SELECT 'SOT12' as sot, c.*
FROM sot12.clm_claim c
WHERE claim_number = '&&claim_number'
UNION
SELECT 'SOT13' as sot, c.*
FROM sot13.clm_claim c
WHERE claim_number = '&&claim_number'
UNION
SELECT 'SOT15' as sot, c.*
FROM sot15.clm_claim c
WHERE claim_number = '&&claim_number'
UNION
SELECT 'SOT22' as sot, c.*
FROM sot22.clm_claim c
WHERE claim_number = '&&claim_number'
UNION
SELECT 'SOT23' as sot, c.*
FROM sot23.clm_claim c
WHERE claim_number = '&&claim_number'
UNION
SELECT 'SOT24' as sot, c.*
FROM sot24.clm_claim c
WHERE claim_number = '&&claim_number'
)
order by sot, claim_number, claim_version

