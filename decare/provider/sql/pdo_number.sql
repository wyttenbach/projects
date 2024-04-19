select * from anthem.clinic_pdo_assignment
where clinic_id=464131; -- 463971

select * from anthem.network_clinic
where clinic_id=463971; 

select * from anthem.network_clinic_provider 
where clinic_id=463971 and network_id in (615,618)
order by provider_id; 

select * from anthem.prov
where provider_id = 999;

SELECT clinic_id, pdo, count(*) FROM anthem.clinic_pdo_assignment GROUP BY clinic_id, pdo HAVING count(*) > 1;

SELECT clinic_id, pdo, pdo_prefix FROM anthem.clinic_pdo_assignment ORDER BY clinic_id, pdo, pdo_prefix;

select * from anthem.clinic_pdo_assignment where length(pdo_prefix) <> 2;

select pdo, substr(pdo, 1, 2), pdo_prefix from anthem.clinic_pdo_assignment where substr(pdo, 1, 2) <> pdo_prefix;