select *
from sot01.drs_document
where business_identifier in (select document_uuid
from sot22.clm_doc_ref
where document_type='LETTER'
and claim_number in (select distinct claim_number from CLM_WIP_GRACE_PERIOD_OUTPUT));
