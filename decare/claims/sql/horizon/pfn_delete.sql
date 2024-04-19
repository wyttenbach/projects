delete from drs_document
where print_file_id in (select print_file_id from drs_print_file
where file_name like '&pfn');

delete from drs_print_file
where file_name like '&pfn';