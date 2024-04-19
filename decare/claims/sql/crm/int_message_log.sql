--unb
select * from internet.int_message_log
where ins_date > trunc(sysdate)
order by log_no desc
