-- webappsvr
SELECT DISTINCT
    bbihh.invoice_id                                                 invoice_id,
    bb.bill_id                                                       bill_id,
    bb.description                                                   descr, -- Account Name on the Query Reprint screen
    ar.description                                                   description,
    bb.ar_customer_no                                                ar_customer_no,
    bbcs.bill_invoice_date                                           invoice_date,
    nvl(bbihh.web_printed_date, bbihh.invoice_printed_date)           original_invoice_date,
    nvl(bbihh.status, 'N/A')                                          status
FROM
    ar_statement_cycles                 ar,
    bil_bill_cycle_schedule             bbcs,
    sot22.gim_bill@cusqueryops          bb,
    bil_bill_inv_cat_pkg                bbicp,
    sot22.gim_subgroup@cusqueryops      gs,
    bil_bill_inv_header_hist            bbihh
WHERE
        bbihh.bill_id = bb.bill_id
    AND bbihh.bill_cycle_schedule_id = bbcs.bill_cycle_schedule_id
    AND bbcs.statement_cycle_id = ar.statement_cycle_id
    AND bbihh.rebill_data_date IS NULL
    AND bbihh.invoice_id = bbicp.invoice_id
    AND bbicp.package_id = gs.subgroup_id
    AND bbicp.invoice_id = bbihh.invoice_id
    AND bbcs.bill_invoice_date BETWEEN add_months(sysdate, - 6) AND sysdate
    --AND upper(bb.description) LIKE upper(?)
    --AND bbcs.bill_invoice_date BETWEEN ? AND ?
    AND bbihh.invoice_id IN (
        SELECT
            bbihhd.invoice_id
        FROM
            bil_bill_inv_header_hist_dest        bbihhd,
            sot22.gim_bill_dest@cusqueryops      bbd
        WHERE
            1=1 --    upper(bbd.user_uid) = upper(?)
            AND bbd.deleted_ind = 'N'
            AND bbd.bill_dest_id = bbihhd.bill_dest_id
        UNION
        SELECT
            fbwdd.invoice_id
        FROM
            fnd_bil_web_dest_docs                fbwdd,
            sot22.gim_bill_dest@cusqueryops      bbd
        WHERE
            1=1 --    upper(bbd.user_uid) = upper(?)
            AND bbd.deleted_ind = 'N'
            AND bbd.bill_dest_id = fbwdd.bill_dest_id
    );