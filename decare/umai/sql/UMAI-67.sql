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

-- Many
select c.customer_number, g.group_number, s.subgroup_number,  CLAIM_HOLD_DATE_OF_SERVICE, PRE_ESTIMATE_HOLD_REASON_VC
from sot22.gim_subgroup s
join sot22.gim_group g on s.group_id = g.group_id
join sot22.gim_customer c on g.customer_id = c.customer_id
where s.CLAIM_HOLD_DATE_OF_SERVICE is null and PRE_ESTIMATE_HOLD_REASON_VC is not null;

-- 200
select trunc(ins_date), count(*) 
from sot22.clm_claim
where receive_date is null
group by rollup(trunc(ins_date))
order by trunc(ins_date) desc;