--cus_sot01
SELECT distinct business_segment_vc, processed_ind, COUNT(*)
FROM fnd_pid_recalc_run_ctl
group by business_segment_vc, processed_ind
ORDER BY 3;
