SELECT COUNT(*)
FROM fnd_pid_recalc_run_ctl
WHERE processed_ind = 'N'
ORDER BY business_segment_vc;
