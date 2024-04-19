select clin.clinic_no, prov.provider_no, clin.directory_addr1, clin.directory_addr2, clin.bill_addr1, clin.bill_addr2, 
prov.first_name, prov.last_name, prov.tin, w9.tin,
lic.*
from unb_provider prov
--join unb_npi npi on (npi.association_table='UNB_PROVIDER' and npi.association_id=prov.provider_no)
join UNB_CLINIC_PROV cp on (cp.provider_no=prov.provider_no)
join unb_clinic clin on (clin.clinic_no=cp.clinic_no)
join UNB_CLINIC_ASSOC_W9 w9assoc on (w9assoc.clinic_no=clin.clinic_no)
join unb_w9_legal w9 on (w9.w9_legal_id=w9assoc.w9_legal_id)
left join unb_license lic on (lic.provider_no=prov.provider_no)
where lic.provider_license_no = '00008078' and lic.state_issued = 'WA';

select clin.clinic_no, prov.provider_no, clin.directory_addr1, clin.directory_addr2, clin.bill_addr1, clin.bill_addr2, 
prov.first_name, prov.last_name, prov.tin, w9.tin,
lic.*
from unb_provider prov
--join unb_npi npi on (npi.association_table='UNB_PROVIDER' and npi.association_id=prov.provider_no)
join UNB_CLINIC_PROV cp on (cp.provider_no=prov.provider_no)
join unb_clinic clin on (clin.clinic_no=cp.clinic_no)
join UNB_CLINIC_ASSOC_W9 w9assoc on (w9assoc.clinic_no=clin.clinic_no)
join unb_w9_legal w9 on (w9.w9_legal_id=w9assoc.w9_legal_id)
left join unb_license lic on (lic.provider_no=prov.provider_no)
where lic.provider_license_no = 'D10162' and lic.state_issued = 'MN';
