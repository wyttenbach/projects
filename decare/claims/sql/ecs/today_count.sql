SELECT count(*)
from SOT01.CLM_ECS_CLAIM
WHERE 1=1
and ('&&transaction_status_ind' is null or '&&transaction_status_ind' is not null and '&&transaction_status_ind' = transaction_status_ind)
and INS_DATE > trunc(SYSDATE - nvl('&&days', 0))
--AND UPPER(PAYER_IDENTIFIER) = '22099';
order by INS_DATE desc;
