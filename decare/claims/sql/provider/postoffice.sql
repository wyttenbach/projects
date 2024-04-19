SELECT distinct first_name, last_name, license, BILL_ADDR1, state_code, tin, directory_addr1
FROM PRO_V_DIRECTORY_TBL
WHERE upper(BILL_ADDR1) LIKE 'P%'
--and rownum < 10
