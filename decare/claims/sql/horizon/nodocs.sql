SELECT sot01.drs_print_file.print_file_id, sot01.drs_print_file.ins_date
FROM sot01.drs_print_file 
LEFT JOIN sot01.drs_document ON (sot01.drs_print_file.print_file_id = sot01.drs_document.print_file_id)
WHERE sot01.drs_document.print_file_id IS NULL;