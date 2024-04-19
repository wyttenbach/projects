select
 trunc(scan_date), claim_type_id, count(*)        from
            CLM_DOCUMENT_IMAGE this_
        where scan_date > sysdate - 30
            and this_.BUSINESS_SEGMENT_VC in (
                55351
            )
            and claim_type_id in (1,2,3,4,5,6,7,8,41) -- 41=encounters
            group by rollup(trunc(scan_date), claim_type_id)
            order by trunc(scan_date) desc, claim_type_id;
            
select * from clm_claim_type where transaction_type_id=1;
