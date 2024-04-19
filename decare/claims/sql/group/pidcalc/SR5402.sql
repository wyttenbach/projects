begin

    for i in (select subgroup_id, business_segment_vc from gim_subgroup_routing where business_segment_vc in (411, 413))
    loop
    
        insert into fnd_pid_recalc_run_ctl (
          business_segment_vc, 
          record_type_ind, 
          processed_ind, 
          subgroup_id, 
          ins_prgm, 
          ins_user, 
          ins_date
        ) values (
          i.business_segment_vc,
          'S',
          'N',
          i.subgroup_id,
          'Group',
          'SR5402',
          sysdate
        );
        
    end loop;
    
    commit;
    
end;
/