select business_identifier, business_type, cms_name, ins_date from sot01.drs_document
where 1=1
and business_type in ('CHECK')
and CMS_NAME like '%12PT%'
--and CMS_NAME like 'UAT_PMT_HORIZ_PRESORT_EOB_DBLWN_2013010809%'
--and business_identifier in ('641')
--and upd_user='batch'
--order by to_number(business_identifier) desc
order by ins_date desc
