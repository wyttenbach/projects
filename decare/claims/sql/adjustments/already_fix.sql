delete from clm_adj_third_party_check  where adj_id=403561;
delete from clm_adj_claim_line where adj_claim_id in (select adj_claim_id from clm_adj_claim where adj_id=403561);
delete from clm_adj_financial_trans where adj_claim_id in (select adj_claim_id from clm_adj_claim where adj_id=403561);
delete from clm_adj_claim where adj_id = 403561;
delete from clm_adj_claim_subscriber where adj_claim_subscriber_id in (select adj_claim_subscriber_id from clm_adj_claim where adj_id=403561);
delete from clm_adj_claim_provider where ADJ_CLAIM_PROVIDER_ID in (select ADJ_CLAIM_PROVIDER_ID from clm_adj_claim where adj_id=403561);
delete from clm_adj_claim_patient where ADJ_CLAIM_PATIENT_ID in (select ADJ_CLAIM_PATIENT_ID from clm_adj_claim where adj_id=403561);
delete from clm_adj where adj_id=403561;
commit;