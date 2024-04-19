select * from clm_adj_claim
where 1=1
and ('&&claim_number' is null or '&&claim_number' is not null and '&&claim_number' = claim_number)
and ('&&claim_uuid' is null or '&&claim_uuid' is not null and '&&claim_uuid' = claim_uuid)
--and (&&adj_id is null or &&adj_id is not null and &&adj_id = adj_id)
and ('&&transmission_status_ind' is null or '&&transmission_status_ind' is not null and '&&transmission_status_ind' = transmission_status_ind)  
-- see also adjustment_finished column as that blocks future adjustments as well
order by ins_date desc
