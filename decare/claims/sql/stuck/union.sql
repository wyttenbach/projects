select *
from
  (
-- routing
   SELECT
     event_time as ins_date, null as upd_date, claim_uuid, claim_number, claim_status, claim_version, 'N/A' as transmission_status_ind, 'N/A' as adj_claim_status
   FROM sot01.clm_claim_routing
   WHERE
     claim_number = '&&claim_number'
   UNION
-- complete
  SELECT
     ins_date, upd_date, claim_uuid, claim_number, 'SOT13', claim_version, 'N/A', 'N/A'
   FROM sot13.clm_claim
   WHERE
     claim_number = '&&claim_number'
   UNION
   SELECT
     ins_date, upd_date, claim_uuid, claim_number, 'SOT15', claim_version, 'N/A', 'N/A'
   FROM sot15.clm_claim
   WHERE
     claim_number = '&&claim_number'
   UNION
   SELECT
     ins_date, upd_date, claim_uuid, claim_number, 'SOT22', claim_version, 'N/A', 'N/A'
   FROM sot22.clm_claim
   WHERE
     claim_number = '&&claim_number'
   UNION
   SELECT
     ins_date, upd_date, claim_uuid, claim_number, 'SOT23', claim_version, 'N/A', 'N/A'
   FROM sot23.clm_claim
   WHERE
     claim_number = '&&claim_number'
   UNION
   SELECT
     ins_date, upd_date, claim_uuid, claim_number, 'SOT24', claim_version, 'N/A', 'N/A'
   FROM sot24.clm_claim
   WHERE
     claim_number = '&&claim_number'
-- adjustments
   UNION
   SELECT
     ins_date, upd_date, claim_uuid, claim_number, 'Adjustment', claim_version, transmission_status_ind, adj_claim_status
   FROM sot01.clm_adj_claim
   WHERE
     claim_number = '&&claim_number'
-- wip
   UNION
   SELECT
     ins_date, upd_date, claim_uuid, claim_number, 'WIP', claim_version, transmission_status_ind, 'N/A'
   FROM sot01.clm_wip_claim
   WHERE
     claim_number = '&&claim_number'
)
order by nvl(upd_date, ins_date)

