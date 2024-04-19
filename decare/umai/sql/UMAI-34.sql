-- Use cus_sot22

select distinct exclude_ai_ind from SOT22.GIM_CUSTOMER;

update SOT22.GIM_CUSTOMER set exclude_ai_ind='Y', upd_user='dwyttenb', upd_date=sysdate where customer_number='0000237230';
commit;

select c.customer_number, g.group_number, s.subgroup_number 
from sot22.gim_subgroup s
join sot22.gim_group g on s.group_id = g.group_id
join sot22.gim_customer c on g.customer_id = c.customer_id
where c.customer_number='0000237230';

-- 0001085217-L01309-D001
update SOT22.GIM_CUSTOMER set exclude_ai_ind='Y', upd_user='dwyttenb', upd_date=sysdate where customer_number='0001085217';
commit;

select *  from SOT22.GIM_CUSTOMER
where exclude_ai_ind='Y';

