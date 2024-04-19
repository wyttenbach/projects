select *
from &&sot..GIM_ID_CARDS_TEMPLATE
where 1=1
and ('&&ID_CARDS_TEMPLATE_id' is null or '&&ID_CARDS_TEMPLATE_id' = ID_CARDS_TEMPLATE_id)

