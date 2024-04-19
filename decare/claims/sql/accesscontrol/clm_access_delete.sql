delete from clm_access_business_seg;
--where access_business_seg_id in (select access_settings_id from clm_access_settings where access_settings_id in (select access_id from clm_access where username like '%&&username'));

delete from clm_access_settings;
--where access_id in (select access_id from clm_access where username like '%&&username');

delete from clm_access;
--where username like '%&&username';

delete from clm_access_claim_type;