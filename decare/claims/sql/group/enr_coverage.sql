select * 
from sot22.enr_coverage
where pass3_contract_code is not null;

select count(*) 
from sot22.enr_coverage
where base_contract_code is not null;
