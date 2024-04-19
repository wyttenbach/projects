select upd_user, count(upd_user)
from SOT01.CLM_DOCUMENT_IMAGE
group by upd_user
order by count(upd_user) desc;

