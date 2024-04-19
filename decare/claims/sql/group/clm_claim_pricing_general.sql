-- Michal: claims processed with these benefit templates 

select *
from sot22.clm_claim_pricing_general 
where entitlement_template_id in
      (select entitlement_template_id
       from sot22.gim_entitlement_template
       where template_identifier in ('IN252216002', 'MO2348216132'))
order by claim_pricing_general_id desc;
