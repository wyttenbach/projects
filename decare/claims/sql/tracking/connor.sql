select
  src.source_identifier DOC,
  claim.entry_claim_id ENTRY_CLAIM_ID,
  claim.submit_date SUBMIT_DATE,
  claim.submitter SUBMITTER,
  claim.claim_uuid UUID,
  sub.identifier SUB_ID,
  sub.first_name FIRST_NAME,
  sub.last_name LAST_NAME,
  prov.tin TIN,
  prov.npi NPI,
  prov.license LICENSE
from
  clm_entry_source src,
  clm_entry_claim claim,
  clm_entry_subscriber sub,
  clm_entry_provider prov
where
  1=1
  and claim.entry_source_id = src.entry_source_id
  and claim.entry_subscriber_id = sub.entry_subscriber_id
  and claim.treating_provider_id = prov.entry_provider_id
  and claim.claim_uuid in (

    select
      claim_uuid
    from
      clm_claim_tracking
    where
      event_name = 'ENTER_ADJ_ENGINE'

    minus

    select
      claim_uuid
    from
      clm_claim_tracking
    where
      event_name = 'EXIT_ADJ_ENGINE'

  )
