select tbl.first_name, tbl.last_name, npi.npi_no, npi.npi_type from pro_v_directory_tbl tbl, sot01.npf_npi npi
where npi.license_no = tbl.license
--and tin = '411854946';
and tin = '470841087';
