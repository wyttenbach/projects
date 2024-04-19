select et.template_identifier, t.*
from sot22.GIM_BENEFIT_TEMPLATE t
join sot22.GIM_ENTITLEMENT_TEMPLATE et on et.entitlement_template_id = t.entitlement_template_id
join sot22.GIM_ENTITLEMENT e on e.entitlement_template_id = t.entitlement_template_id
where 1=1
--and ('&&BENEFIT_TEMPLATE_id' is null or '&&BENEFIT_TEMPLATE_id' = BENEFIT_TEMPLATE_id)
--and ('&&template_identifier' is null or '&&template_identifier' = template_identifier)
--and template_identifier like 'EH%'
and benefit_template_id=1532775
;