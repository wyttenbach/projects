SELECT distinct DIRECTORY_ADDR1
from PROV.PRO_CLINIC c, PROV.PRO_PROVIDER p, PROV.PRO_NETWORK_CLINIC_PROVIDER a
where a.clinic_no = c.clinic_no
and a.provider_no = p.provider_no
and p.provider_no = 1;
