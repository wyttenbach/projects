select * from &&sot..gim_customer
where 1=1
and ('&&customer_id' is null or '&&customer_id' = customer_id)
and ('&&customer_number' is null or '&&customer_number' = customer_number);
-- can get customer_id from clm_claim

SELECT
    gimcustome0_.customer_id                AS customer1_24_,
    gimcustome0_.version_number             AS version2_24_,
    gimcustome0_.effective_date             AS effective3_24_,
    gimcustome0_.alt_id_assignment_vc       AS alt4_24_,
    gimcustome0_.web_url                    AS web5_24_,
    gimcustome0_.enr_source_id              AS enr6_24_,
    gimcustome0_.employer_tax_id            AS employer7_24_,
    gimcustome0_.exchange_assigned_group_id AS exchange8_24_,
    gimcustome0_.business_partner_contact   AS business9_24_,
    gimcustome0_.ome_ind                    AS ome10_24_,
    gimcustome0_.medical_system             AS medical11_24_,
    gimcustome0_.business_partner_vc        AS business12_24_,
    gimcustome0_.association_vc             AS associa13_24_,
    gimcustome0_.marketing_contact_name_vc  AS marketing14_24_,
    gimcustome0_.underwriting_id            AS underwr15_24_,
    gimcustome0_.name                       AS name24_,
    gimcustome0_.customer_number            AS customer17_24_,
    gimcustome0_.county                     AS county24_,
    gimcustome0_.postal_code                AS postal19_24_,
    gimcustome0_.state_province_vc          AS state20_24_,
    gimcustome0_.sales_rep_vc               AS sales21_24_,
    gimcustome0_.national_local_vc          AS national22_24_,
    gimcustome0_.dds_adjudication_date      AS dds23_24_,
    gimcustome0_.exchange_name_vc           AS exchange24_24_,
    gimcustome0_.erisa_ind                  AS erisa25_24_,
    gimcustome0_.state_regulator            AS state26_24_,
    gimcustome0_.exclude_ai_ind             AS exclude27_24_,
    gimcustome0_.ins_date                   AS ins28_24_,
    gimcustome0_.ins_prgm                   AS ins29_24_,
    gimcustome0_.ins_user                   AS ins30_24_,
    gimcustome0_.upd_date                   AS upd31_24_,
    gimcustome0_.upd_prgm                   AS upd32_24_,
    gimcustome0_.upd_user                   AS upd33_24_
FROM
    sot22.gim_customer gimcustome0_
WHERE
    gimcustome0_.customer_id = 1
