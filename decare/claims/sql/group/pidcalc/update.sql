update fnd_pid_recalc_run_ctl set processed_ind = 'Y';
update fnd_pid_recalc_run_ctl set processed_ind = 'N' where ROWNUM <= &1;
commit;
