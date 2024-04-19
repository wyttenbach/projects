select * from clm_change_history h, clm_change_history_field f
where h.change_history_id = f.change_history_id(+)
and h.root_uuid in (select claim_uuid from clm_claim_routing where claim_number like '%&&claim_number')
and h.ins_date > trunc(sysdate - &&days)
order by h.ins_date
