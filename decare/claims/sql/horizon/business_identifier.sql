select business_identifier, business_type, cms_name, ins_date from sot01.drs_document
where 1=1
--and business_type in ('EOB','CHECK')
--and business_identifier in ('a601b820-6d0d-4477-97e4-76eb193689b1')
--and upd_user='batch'
--order by to_number(business_identifier) desc
and cms_name is not null
and cms_type is not null
order by ins_date desc
