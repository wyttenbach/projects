-- ddsenr/subscriber/33429/18014463
-- ddsenr/dependent/47871/17687679 -- not sure about this one, copied from adj report
-- ddsgim/subgroup/33429/542436
-- ddsgim/historycrosscheck_template/47871/76801    -- logical routines
-- ddsgim/pricingconfig_template/47871/2158
-- ddsgim/benefit_template/33429/313591
select system_type||'/'||entity_type||'/'||system_identifier ident, enq_time, deq_time from (
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
  and qt.user_data.HEADER.get_string_property('systemType') like '%&&systemType'
  and qt.user_data.HEADER.get_string_property('entityType') like '%&&entityType'
  and qt.user_data.HEADER.get_string_property('systemIdentifier') like '%&&bussegvc/%&&id'
  and qt.enq_time >= trunc(sysdate - nvl('&&days', 0))
  )
order by
--ident;
enq_time desc;

