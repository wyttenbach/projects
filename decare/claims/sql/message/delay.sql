select min(qt.enq_time),max(qt.enq_time)
  from
  SOT01.DYNAMIC_FEEDER_Q qt
  where 1=1
  and qt.deq_time is null;

