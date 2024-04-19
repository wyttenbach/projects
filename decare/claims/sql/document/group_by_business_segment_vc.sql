select count(*), min(ins_date), max(ins_date), business_segment_vc 
from clm_document_image 
group by business_segment_vc;

