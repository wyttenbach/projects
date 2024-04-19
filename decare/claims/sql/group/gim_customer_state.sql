select fvcc.attribute_1_char 
from sot14.gim_customer gc 
join fnd_valid_code_child fvcc ON fvcc.valid_code_parent_id = 4 
and valid_code_child_id = gc.state_province_vc 
and gc.customer_id = 143989;