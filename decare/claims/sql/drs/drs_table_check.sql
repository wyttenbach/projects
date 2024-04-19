set echo off
--set term off -- only if spooling
set timing off
set heading off
set feedback off
set linesize 32767
set pagesize 0
SELECT ins_date, bus_seg_actual, business_type, count(*)
FROM (
select
  trunc(pf.ins_date) as ins_date,
  SUBSTR(pf.file_Name,9,INSTR(pf.file_Name,'_',9)-9) as bus_seg_actual,
  SUBSTR(d.ins_prgm,9,INSTR(d.ins_prgm,'_',9)-9) as bus_seg_desired,
  d.business_type
  from sot01.drs_print_file pf, sot01.drs_document d
  where d.print_file_id = pf.print_file_id)
where bus_seg_actual != bus_seg_desired
group by ins_date, bus_seg_actual, business_type
/
exit
