select i.document_image_id, i.document_number, r.claim_number from clm_claim_routing r, clm_document_image i
where r.source_identifier=i.document_number
and r.claim_number is not null
and i.xray_ind='Y'
and i.ins_date < sysdate - 7
order by 1 desc;

-- Claim number 67423935 (attachment is not an X-Ray)
-- Claim number 67585899 (attachment is an X-Ray)
