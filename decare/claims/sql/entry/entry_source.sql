select * from clm_entry_source source, clm_entry_claim claim
where source.entry_source_id = claim.entry_source_id
and source_identifier like '%&&source_identifier'
and source.ins_user like '%&&ins_user'
--and external_id is null
--and claim_uuid like '%&&claim_uuid'
--and trunc(source.ins_date) = '&&date'
order by source.ins_date
