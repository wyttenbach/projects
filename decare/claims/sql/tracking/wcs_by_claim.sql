select * from clm_wcs_claim
where wcs_claim_id in (select distinct source_identifier from clm_claim_tracking where claim_number like '%&&claim_number')
