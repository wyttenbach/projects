-- when batch job updates the group, messages should be sent as follows
select system_type||'/'||entity_type||'/'||system_identifier ident, deq_time from (
  select
  qt.msgid,
  qt.state state,
  qt.enq_time enq_time,
  qt.deq_time deq_time,
  qt.user_data.HEADER.get_string_property('entityType') entity_type,
  qt.user_data.HEADER.get_string_property('systemType') system_type,
  qt.user_data.HEADER.get_string_property('systemIdentifier') system_identifier
  from
  SOT01.DYNAMIC_FEEDER_Q qt
  where 1=1
  and qt.user_data.HEADER.get_string_property('systemType') = 'ddsgim'
  and qt.user_data.HEADER.get_string_property('entityType') = 'subgroup'
  and qt.enq_time >= trunc(sysdate - &days)
  );

