select subscriber_identifier, subscriber_last_name, count(claim_number) from clm_claim_tracking
where 1=1
and event_time > sysdate - &&days
group by subscriber_identifier, subscriber_last_name
order by count(claim_number) desc
