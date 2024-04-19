update drs_document
set cms_name=null
where print_file_id in (select print_file_id from drs_print_file
where file_name like '&pfn');

update drs_print_file
set cms_name=null
where file_name like '&pfn';