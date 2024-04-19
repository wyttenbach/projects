SELECT distinct prov.first_name, prov.last_name, clinic.BILL_ADDR1, clinic.directory_addr1
FROM UNB.UNB_CLINIC clinic
INNER JOIN UNB.UNB_CLINIC_PROV ON
   clinic.CLINIC_NO = UNB_CLINIC_PROV.CLINIC_NO
INNER JOIN UNB.UNB_PROVIDER prov ON
   UNB_CLINIC_PROV.PROVIDER_NO = prov.PROVIDER_NO
and upper(BILL_ADDR1) LIKE 'P%'
and rownum < 10
