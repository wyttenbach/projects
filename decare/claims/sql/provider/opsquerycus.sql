SELECT
    pro.network_no,
    pro.short_descr
FROM
    pro_network@opsquerycus           pro,
    pro_network_busseg@opsquerycus    pro_bs
WHERE
        pro.network_no = pro_bs.network_no
    AND pro_bs.business_segment_vc = '33429'
UNION
SELECT
    unb.network_no,
    unb.short_descr
FROM
    unb_network@opsquerycus           unb,
    unb_network_busseg@opsquerycus    unb_bs
WHERE
        unb.network_no = unb_bs.network_no
    AND unb_bs.business_segment_vc = '33429';
]
