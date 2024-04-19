-- SQL 1: assert num_rows==5 (PASS)
select p.print_file_id, p.file_name
from sot01.drs_print_file p
where 1=1
and p.file_name like 'DRSPDF_DEEEBEXX_ANTHM_02102022_070248%'
order by p.file_name;

-- SQL 2: assert num_rows==5 (Expected 5, got 1)
select business_identifier, p.file_name, print_file_start_page, print_file_end_page, d.ins_date, d.upd_date
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and p.file_name like 'DRSPDF_DEEEBEXX_ANTHM_02102022_070248%'
and print_file_start_page=1;

select business_identifier, p.file_name, print_file_start_page, print_file_end_page, d.ins_date, d.upd_date
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and p.file_name like 'DRSPDF_DEEEBEXX_ANTHM_02102022_070248%'
and print_file_end_page=242702;

select business_identifier, p.print_file_id, p.file_name, print_file_start_page, print_file_end_page, d.cms_name, d.ins_date, d.upd_date
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and p.file_name like 'DRSPDF_DEEEBEXX_ANTHM_02102022_070248%'
and print_file_start_page=242703;

-- Tue Mar 1, 2022 update
update sot01.drs_document
set print_file_id=182677, print_file_start_page=1, print_file_end_page=4, cms_name=null, upd_user='ab94482', upd_prgm='SQL Developer', upd_date=sysdate
where business_identifier='841c7bad-8951-4ba6-9438-13db77c26b93';

commit;

-- After the update, repeat SQL 2, result is slightly better
-- assert num_rows==5 (FAIL: Expected 5, got 2)
select business_identifier, p.file_name, print_file_start_page, print_file_end_page, d.cms_name, d.ins_date, d.upd_date
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and p.file_name like 'DRSPDF_DEEEBEXX_ANTHM_02102022_070248%'
and print_file_start_page=1;
-- result: cms_name='DRSPDF_DEEEBEXX_ANTHM_02102022_070248_2_1-4.pdf'

-- what claim number is this document associated with?
select claim_number, subscriber_last_name from sot22.clm_doc_ref
where document_uuid = '841c7bad-8951-4ba6-9438-13db77c26b93';
-- result: 65313542, BHANDARI

-- Wed Mar 2, 2022 example from Bisht, Swarnima
select d.document_id, business_identifier, p.print_file_id, p.file_name, print_file_start_page, print_file_end_page, d.cms_name, d.ins_date, d.upd_date
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and p.file_name like 'DRSPDF_DEEEBEXX_ANTHM_02102022_070248%'
and business_identifier='a6e4f1ff-2212-4287-9f92-d19403ca61c7';
-- result: document_id = 93862049 (not the original row, but the row that was inserted afterwards)

-- Update only the print_file_id because the 11-14 page range is correct
update sot01.drs_document
set print_file_id=182680, cms_name=null, upd_user='ab94482', upd_prgm='SQL Developer', upd_date=sysdate
where document_id=93862049;

commit;

-- what claim number is this document associated with?
select claim_number, subscriber_last_name from sot22.clm_doc_ref
where document_uuid = 'a6e4f1ff-2212-4287-9f92-d19403ca61c7';
-- result: 65324484	DUGAN

-- Back to example I previously updated on 1 March, should really have inserted a new record instead because the original page ranges are lost now
-- and should be put back before the scripts are used
select business_identifier, p.print_file_id, p.file_name, print_file_start_page, print_file_end_page, d.cms_name, d.ins_date, d.upd_date
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and p.file_name like 'DRSPDF_DEEEBEXX_ANTHM_02102022_070248%'
and business_identifier='841c7bad-8951-4ba6-9438-13db77c26b93';
-- OPSPP: 182551	DRSPDF_DEEEBEXX_ANTHM_02102022_070248.pdf	242703	242706

select p.file_name, max(print_file_start_page), max(print_file_end_page)
from sot01.drs_document d, sot01.drs_print_file p
where d.print_file_id = p.print_file_id
and p.file_name like 'DRSPDF_DEEEBEXX_ANTHM_02102022_070248%'
group by p.file_name;