select count(1) from (
SELECT DISTINCT
    period.business_segment_vc,
    period.subgroup_id
FROM
    fnd_gim_subgroup_period_vw period,
    fnd_gim_status_vw status
WHERE
    period.subgroup_id = status.subgroup_id       AND status.status_vc = 27099       /* only interested in most recent status */       AND NOT EXISTS(
        SELECT 'X'
                FROM fnd_gim_status_vw status1
            WHERE status1.subgroup_id = period.subgroup_id
            AND status1.status_date > status.status_date)       AND
            period.end_date >= sysdate        AND
            period.end_date <= to_date('31-DEC-2022', 'DD-MON-YYYY')       /* only interested in most recent period */
    AND NOT EXISTS(
        SELECT 'X'                       FROM fnd_gim_subgroup_period_vw period1                      WHERE period1.subgroup_id = period.subgroup_id
                            AND period1.end_date > to_date('31-DEC-2022', 'DD-MON-YYYY')                                                    AND period1.period_type = period.period_type)
  AND period.business_segment_vc NOT IN (2,3,4,402,403,404,405,406,407,408,1558,1559,1560,33003) ORDER BY period.business_segment_vc)