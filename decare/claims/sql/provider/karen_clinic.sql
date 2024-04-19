select distinct clinic_no, directory_addr1 from pro_v_directory_tbl
where upper(first_name) like 'KAREN'
and upper(last_name) like 'KOHLER'
order by directory_addr1;
