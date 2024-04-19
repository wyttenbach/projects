select clin.clinic_no, prov.provider_no, clin.directory_addr1, clin.directory_addr2, clin.bill_addr1, clin.bill_addr2, lic.*
from unb_provider prov
join unb_npi npi on (npi.association_table='UNB_PROVIDER' and npi.association_id=prov.provider_no)
join UNB_CLINIC_PROV cp on (cp.provider_no=prov.provider_no)
join unb_clinic clin on (clin.clinic_no=cp.clinic_no)
join UNB_CLINIC_ASSOC_W9 w9assoc on (w9assoc.clinic_no=clin.clinic_no)
join unb_w9_legal w9 on (w9.w9_legal_id=w9assoc.w9_legal_id)
left join unb_license lic on (lic.provider_no=prov.provider_no)
--where npi.npi='808401366639072' and w9.tin='222237948'  
where npi.npi='808401548568280' and w9.tin='263030279'
--where npi.npi='&&npi' and w9.tin='&&tin' 
--AND prov.VENDOR='HORIZON'

