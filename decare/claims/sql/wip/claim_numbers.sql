select *
from clm_wip_claim
where 1=1
--and claim_submission_source='PAPER'

-- vigesh PRDSDC-9846 grace period letters
--and claim_number in ('41757861','41719033','41637340','41398303','41398280','41398283','41383992','40581050')

order by upd_date desc, ins_date desc


