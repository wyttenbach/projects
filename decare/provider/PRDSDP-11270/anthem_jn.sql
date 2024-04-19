select * from anthem_jn.network_clinic
where frozen_from is not null
and is_frozen='N'order by network_id, clinic_id, journal_id;
