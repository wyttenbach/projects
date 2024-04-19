-- NOTE NOTE NOTE NOTE
-- Not useful for 'simple' claims which have no related document image 
-- NOTE NOTE NOTE NOTE
select d.document_number, d.upd_date as entry_date, s.*
FROM clm_document_image d, clm_claim_tracking s
where d.upd_date >= sysdate - 1
and d.claim_uuid = s.claim_uuid(+)
order by s.tracking_id desc, d.document_number desc
