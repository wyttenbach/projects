select entity_type, min(enq_time), max(enq_time), count(*) from (
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
  where enq_time > trunc(sysdate - nvl('&&days', 7))
	and enq_time < 1+ sysdate - nvl('&&days', 7)

  )
group by rollup(entity_type)
order by count(*);

