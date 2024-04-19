set echo off
--set term off -- only if spooling
set verify off
set timing off
set heading off
set feedback off
set linesize 32767
set pagesize 0
select 'http://alena.decare.com:10010/messages/' || to_char(event_time,'YYYY_MM_DD') || '/' || claim_uuid
from clm_claim_routing 
where claim_number = '&&1'
/
exit

