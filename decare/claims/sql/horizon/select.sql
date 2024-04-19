select * from sot01.drs_document
where print_file_id in (select print_file_id from sot01.drs_print_file
where file_name like '&pfn');

--select * from sot01.drs_print_file
--where file_name like '&pfn';
