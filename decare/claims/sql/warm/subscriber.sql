select count(*) from subscriber;

select MIN(INSERT_TIMESTAMP), MAX(INSERT_TIMESTAMP)
from SUBSCRIBER;

select * from subscriber
where subs_sys_ident like '%/33429/55629854'; -- me
where subs_sys_ident like 'ddsenr:subscriber/55351/63101734'; -- not me
--where subscriber_identifier='...';