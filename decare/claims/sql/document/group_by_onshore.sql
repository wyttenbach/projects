select count(*), min(ins_date), max(ins_date), initial_onshore_ind 
from clm_document_image 
group by initial_onshore_ind;

