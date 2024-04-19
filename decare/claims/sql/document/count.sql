select count(*), key_account_id from clm_document_image group by key_account_id;
select count(*), claim_type_id from clm_document_image group by claim_type_id;
select count(*), business_segment_vc from clm_document_image group by business_segment_vc;
select count(*), document_status_vc from clm_document_image group by document_status_vc;
