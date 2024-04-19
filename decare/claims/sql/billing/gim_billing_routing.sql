SELECT
    decode(attribute_1_char, 'DDPMN', 'DDMN', 'DDPNE', 'DDNE',
           'SECUR', 'SECURIAN', 'PATMM', 'SECURIAN-NE', 'DCARE',
           'DECARE', 'DCASI', 'DDMN-DCASI', 'FLEXC', 'DDMN-FLEXC',
           'MEDCC', 'DDMN-MEDCC', 'MEDPP', 'DDMN-MEDPP', 'MNPWR',
           'DDMN-MNPWR', 'PPROG', 'DDMN-PPROG', 'WATDA', 'DDMN-WATDA',
           'WLSON', 'DDMN-WLSON', 'ZENTH', 'DDMN-ZENTH', 'BNFTS',
           'DDMN-BNFTS', 'FLEXC', 'DDMN-FLEXC', 'MNPWR', 'DDMN-MNPWR',
           'WLPT', 'ANTHEM', attribute_1_char)                                                                        business_segment,
    attribute_3_char                                                                                                                                                                                                                                                                                                                                                                                                                                                                            sot_schema
FROM
    fnd_valid_code_child
WHERE
        valid_code_parent_id = 3
    AND valid_code_child_id IN (
        SELECT DISTINCT
            ( business_segment_vc )
        FROM
            (
                SELECT
                    bill_id
                FROM
                    bil_bill_inv_header_hist
--                WHERE
--                    status IN (
--                        ?,
--                        ?,
--                        ?
--                    )
--                    AND 
                    WHERE web_printed_date >= add_months(sysdate, - 4)
            )     bbihh,
            sot01.gim_billing_routing@cusqueryops                                                                                                 gbr
        WHERE
                bbihh.bill_id = gbr.bill_id
            AND gbr.business_segment_vc IN (
                2,
                3,
                14871,
                402,
                413,
                411,
                1559,
                1560,
                403,
                404,
                405,
                406,
                407,
                408,
                33429
            )
    )
ORDER BY
    business_segment