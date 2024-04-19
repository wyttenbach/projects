select
       ecs_claim_hdr_id,
       ins_date,
       file_name
  from
       clm_ecs_claim_hdr
  where
       submitter_org_name = 'ANTHEM DNTL OCR';
