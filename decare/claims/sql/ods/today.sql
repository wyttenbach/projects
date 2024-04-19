select *
from clm_wip_claim
where
  PRIMARY_SUSPEND_CODE=972 and
  ins_date > trunc(sysdate - nvl('&&days', 0))
order by ins_date desc;

-- grep $(SUBSCRIBER_INC_IDENTIFIER) /logs/agon/easerver/easerver.log
