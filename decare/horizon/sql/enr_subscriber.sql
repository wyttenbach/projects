desc sot23.enr_subscriber

SELECT
    sot23.enr_subscriber.output_method_vc,
    COUNT(*)
FROM
    sot23.enr_subscriber
GROUP BY
    ROLLUP(sot23.enr_subscriber.output_method_vc)
ORDER BY
    2 DESC;
    
select * 
from sot23.enr_subscriber
where subscriber_id=58739965
-- OPSDD 9 Feb 2023
--and first_name='HIXMR'
--and last_name='XQAJB'
-- OPSJD 9 Feb 2023
and first_name='MGIQH'
and last_name='COLNR'
order by date_of_birth desc;

select subscriber_id, first_name, middle_name, last_name, date_of_birth, output_method_vc, upd_prgm, upd_user, upd_date
from sot23.enr_subscriber
where output_method_vc=78606
order by upd_date desc;

update sot23.enr_subscriber
set output_method_vc=78606, upd_user='dwyttenb', upd_date=sysdate, upd_prgm='SQL'
where subscriber_id=58739965
- OPSDD 9 Feb 2023
--and first_name='HIXMR'
--and last_name='XQAJB'
-- OPSJD 9 Feb 2023
and first_name='MGIQH'
and last_name='COLNR'

commit;

