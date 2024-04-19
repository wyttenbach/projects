update
  SOT01.WH_TASK t
set t.actual_owner='rrobich'
where t.task_payload_id = 609610123
and t.actual_owner is null
and t.name='Adjustment.PrimaryAuditSupervisorReview'
and t.status='Ready'

