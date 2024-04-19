update SOT01.DYNAMIC_FEEDER_Q set STATE=0 where MSGID in (
  select MSGID from  SOT01.DYNAMIC_FEEDER_Q qt 
    where deq_time >= TO_DATE('08-MAY-2016','DD-MON-YYYY')
    and deq_time <= TO_DATE('09-MAY-2016 10:10','DD-MON-YYYY HH24:MI')
);
