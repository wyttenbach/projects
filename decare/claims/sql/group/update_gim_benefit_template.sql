SELECT
    sot22.gim_entitlement.*
FROM
         sot22.gim_benefit_template
    INNER JOIN sot22.gim_entitlement_template ON sot22.gim_entitlement_template.entitlement_template_id = sot22.gim_benefit_template.entitlement_template_id
    INNER JOIN sot22.gim_entitlement ON sot22.gim_entitlement.entitlement_template_id = sot22.gim_benefit_template.entitlement_template_id
WHERE
        1 = 1
    AND ( '&&template_identifier' IS NULL
          OR '&&template_identifier' = sot22.gim_entitlement_template.template_identifier );
      -- VA 669J
      
update sot22.gim_entitlement
set subsidy_pass3_ent_templ_id=subsidy_base_ent_templ_id,
upd_user='dwyttenb',
upd_prgm='SQL',
upd_date=sysdate
where entitlement_id=458278;
          
commit;          
          