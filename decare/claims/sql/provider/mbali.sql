undefine npi;
undefine tin;
undefine vendor;

desc unb_provider

--original from Michal
select prov.provider_no, clin.clinic_no, clin.directory_addr1, clin.directory_addr2, clin.bill_addr1, clin.bill_addr2
from unb_provider prov
join unb_npi npi on (npi.association_table='UNB_PROVIDER' and npi.association_id=prov.provider_no)
join UNB_CLINIC_PROV cp on (cp.provider_no=prov.provider_no)
join unb_clinic clin on (clin.clinic_no=cp.clinic_no)
join UNB_CLINIC_ASSOC_W9 w9assoc on (w9assoc.clinic_no=clin.clinic_no)
join unb_w9_legal w9 on (w9.w9_legal_id=w9assoc.w9_legal_id)
where npi.npi='808401447593991' and w9.tin='222692491' AND prov.VENDOR='HORIZON';
-- PROVIDER_NO, CLIINC_NO opssf 3/6/2023
--645383	649389
--645383	649394
--645383	649396
--645383	649392
--645383	649395
--645383	649397
--645383	649390
--645383	649393
--645383	649391

select prov.provider_no, clin.clinic_no, prov.vendor, w9.tin, clin.directory_addr1, clin.directory_addr2, clin.bill_addr1, clin.bill_addr2
from unb_provider prov
join unb_npi npi on (npi.association_table='UNB_PROVIDER' and npi.association_id=prov.provider_no)
join UNB_CLINIC_PROV cp on (cp.provider_no=prov.provider_no)
join unb_clinic clin on (clin.clinic_no=cp.clinic_no)
join UNB_CLINIC_ASSOC_W9 w9assoc on (w9assoc.clinic_no=clin.clinic_no)
join unb_w9_legal w9 on (w9.w9_legal_id=w9assoc.w9_legal_id)
--where npi.npi='&&npi' and w9.tin='&&tin';
where npi.npi='808401447593991'
and clin.clinic_no=649389;
-- w9.tin opsjd 3/6/2023
--222692491

select prov.provider_no, clin.clinic_no, clin.directory_addr1, clin.directory_addr2, clin.bill_addr1, clin.bill_addr2
from unb_provider prov
join unb_npi npi on (npi.association_table='UNB_PROVIDER' and npi.association_id=prov.provider_no)
join UNB_CLINIC_PROV cp on (cp.provider_no=prov.provider_no)
join unb_clinic clin on (clin.clinic_no=cp.clinic_no)
join UNB_CLINIC_ASSOC_W9 w9assoc on (w9assoc.clinic_no=clin.clinic_no)
join unb_w9_legal w9 on (w9.w9_legal_id=w9assoc.w9_legal_id)
where prov.provider_no=645383 and clin.clinic_no=649389;
-- unmasked directory_addr1, directory_addr2, bill_addr1, bill_addr2 opsjd 3/6/2023
-- 2 Washington Ave		(null)  320 SOUTH MAIN STREET	2ND FLOOR