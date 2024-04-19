select
  fes.eep_status_id, fes.file_id, ffe.file_config_id, fes.description,
  fes.start_time, fes.finish_time, fes.sub_count,
  round(((fes.finish_time - fes.start_time)*84600),2) as duration,
  round((fes.sub_count/((fes.finish_time - fes.start_time)*84600)),2) as subs_per_second
from
  fnd_file ffe, fnd_eep_status fes, fnd_file_config ffc
where
  ffe.file_id = fes.file_id and
  ffe.file_config_id = ffc.file_config_id
-- and ffc.file_type_vc = 13121 --Update file
  --and ffc.file_config_id = 11896 -- ISG Full pop.
  and
  fes.status_vc = 19592 -- Preprocess complete
  --and fes.status_vc = 19596 -- Load complete
  --and fes.start_time > to_date('2016-11-21 21:22:00', 'YYYY-MM-DD HH24:MI:SS')
  and
  fes.start_time > trunc(sysdate)
--and fes.sub_count > 1000
  --and fes.sub_count < 200
  and
  (fes.finish_time - fes.start_time) > 0
-- and rownum < 101
order by fes.finish_time desc;
--order by subs_per_second desc;  -- average 87.67 +/- 49.29, total 12537.01, median 83.60, minimum 0.26, maximum 242.77, n = 143


