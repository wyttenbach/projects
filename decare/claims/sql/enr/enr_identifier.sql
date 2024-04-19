select *
from sot22.enr_subscriber
where
  subscriber_id in
    (select association_id
     from sot22.enr_identifier
     where
       identifier = '225761421'
       --identifier = '951M11271'
       )

