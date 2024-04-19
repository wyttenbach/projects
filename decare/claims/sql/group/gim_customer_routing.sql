select trunc(dds_adjudication_date), count(*)
from gim_customer_routing
group by rollup(trunc(dds_adjudication_date))
order by count(*) desc;

SELECT
    gimcustome0_.customer_routing_id   AS customer1_32_0_,
    gimcustome0_.version_number        AS version2_32_0_,
    gimcustome0_.customer_number       AS customer3_32_0_,
    gimcustome0_.effective_date        AS effective4_32_0_,
    gimcustome0_.alt_id_assignment_vc  AS alt5_32_0_,
    gimcustome0_.industry_vc           AS industry6_32_0_,
    gimcustome0_.customer_id           AS customer7_32_0_,
    gimcustome0_.underwriting_id       AS underwri8_32_0_,
    gimcustome0_.business_partner_vc   AS business9_32_0_,
    gimcustome0_.dds_adjudication_date AS dds10_32_0_,
    gimcustome0_.name                  AS name32_0_,
    gimcustome0_.status_vc             AS status12_32_0_,
    gimcustome0_.status_date           AS status13_32_0_,
    gimcustome0_.current_status_vc     AS current14_32_0_,
    gimcustome0_.current_status_date   AS current15_32_0_,
    gimcustome0_.future_status_vc      AS future16_32_0_,
    gimcustome0_.future_status_date    AS future17_32_0_,
    gimcustome0_.business_segment_vc   AS business18_32_0_,
    gimcustome0_.ins_date              AS ins19_32_0_,
    gimcustome0_.ins_prgm              AS ins20_32_0_,
    gimcustome0_.ins_user              AS ins21_32_0_,
    gimcustome0_.upd_date              AS upd22_32_0_,
    gimcustome0_.upd_prgm              AS upd23_32_0_,
    gimcustome0_.upd_user              AS upd24_32_0_
FROM
    gim_customer_routing gimcustome0_
WHERE
    gimcustome0_.customer_id = 1;