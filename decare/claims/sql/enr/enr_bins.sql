    select
        *
    from
        ( select
            gendocumen0_.DOCUMENT_IMAGE_ID as DOCUMENT1_17_,
            gendocumen0_.BATCH_NUMBER as BATCH2_17_,
            gendocumen0_.BUSINESS_SEGMENT_VC as BUSINESS3_17_,
            gendocumen0_.DOCUMENT_NUMBER as DOCUMENT4_17_,
            gendocumen0_.DOCUMENT_STATUS_VC as DOCUMENT5_17_,
            gendocumen0_.DOCUMENT_UUID as DOCUMENT6_17_,
            gendocumen0_.EXTERNAL_ID as EXTERNAL7_17_,
            gendocumen0_.DOCUMENT_TYPE_ID as DOCUMENT23_17_,
            gendocumen0_.IMAGE_FORMAT as IMAGE8_17_,
            gendocumen0_.INITIAL_ONSHORE_IND as INITIAL9_17_,
            gendocumen0_.INS_DATE as INS10_17_,
            gendocumen0_.INS_PRGM as INS11_17_,
            gendocumen0_.INS_USER as INS12_17_,
            gendocumen0_.KEY_ACCOUNT_ID as KEY13_17_,
            gendocumen0_.MULTIPLE_PAGE_IND as MULTIPLE14_17_,
            gendocumen0_.OWNER as OWNER17_,
            gendocumen0_.PRIORITY_TYPE as PRIORITY16_17_,
            gendocumen0_.RCVD_DATE as RCVD17_17_,
            gendocumen0_.SCAN_DATE as SCAN18_17_,
            gendocumen0_.SCAN_OPERATOR as SCAN19_17_,
            gendocumen0_.UPD_DATE as UPD20_17_,
            gendocumen0_.UPD_PRGM as UPD21_17_,
            gendocumen0_.UPD_USER as UPD22_17_
        from
            GEN_DOCUMENT_IMAGE gendocumen0_,
            GEN_DOCUMENT_TYPE gendocumen1_
        where
            gendocumen0_.DOCUMENT_TYPE_ID=gendocumen1_.DOCUMENT_TYPE_ID
            and (
                gendocumen0_.DOCUMENT_UUID is null
            )
            and gendocumen1_.TRANSACTION_TYPE_ID=? )
    where
        rownum <= ?
