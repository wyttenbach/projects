select provider_no, clinic_no, tin, license, directory_addr1 from pro_v_directory_tbl
where upper(first_name) like 'KAREN'
and upper(last_name) like 'KOHLER';
