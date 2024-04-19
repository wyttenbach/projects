select claim.claim_number, claim.claim_version, line.*
from clm_adj_claim claim, clm_adj_claim_line line
where line.adj_claim_id = claim.adj_claim_id                
and claim_number = '&&claim_number'
--and claim.claim_number in ('8234550','14206702')
