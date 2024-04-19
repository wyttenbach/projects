select d.document_number, d.upd_date as entered,
c.fee_total, c.primary_auditor_id as auditor1, c.primary_audit_complete_date as audited1, c.secondary_auditor_id as auditor2,c.SECONDARY_AUDIT_COMPLETE_DATE as audited2,
s.*
FROM clm_document_image d, clm_entry_claim c, clm_claim_tracking s
where d.upd_date >= sysdate - 1
and d.claim_uuid = c.claim_uuid(+)
and d.claim_uuid = s.claim_uuid(+)
order by s.tracking_id desc, entered desc
