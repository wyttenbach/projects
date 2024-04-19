select trunc(processed_date), count(case when claim_submission_source in ('ECS') then 1 else null end) as ECS,
       count(case when claim_submission_source in ('PAPER', 'OCR') then 1 else null end) as PAPERandOCR, count(unique claim_number) as TOTAL,
       to_char(count(case when claim_submission_source in ('PAPER', 'OCR') then 1 else null end)*100 / count(unique claim_number), 'fm99D00') as percentageOfPaperAndOcr,
       count(document_image_id)
from (
         select unique cl.claim_number, trunc(cl.processed_date) as processed_date, cl.claim_submission_source, img.document_image_id
         from sot22.clm_claim cl
                  join sot22.gim_customer cus on cus.customer_id = cl.customer_id
                  join sot22.clm_claim_line ln on ln.claim_id = cl.claim_id
                  left join clm_document_image img on img.claim_uuid=cl.claim_uuid
         where cl.processed_date >= sysdate - 90
           and state_province_vc not in (14, 18, 23, 33)
           and ln.procedure_category_id in (14)
           and cl.xray_ind='Y'
     )
group by trunc(processed_date)
order by trunc(processed_date) desc;

select claim_submission_source, count(*)
from sot22.clm_claim cl
--join sot22.gim_customer cus on cus.customer_id = cl.customer_id
--join sot22.clm_claim_line ln on ln.claim_id = cl.claim_id
where cl.processed_date >= sysdate - 90
           --and state_province_vc not in (14, 18, 23, 33)
           --and ln.procedure_category_id in (14)
           --and cl.xray_ind='Y'
group by rollup(claim_submission_source);
           
select claim_submission_source, count(*)
from clm_wip_claim cl
--join sot22.gim_customer cus on cus.customer_id = cl.customer_id
--join sot22.clm_claim_line ln on ln.claim_id = cl.claim_id
where cl.ins_date >= sysdate - 90
           --and state_province_vc not in (14, 18, 23, 33)
           --and ln.procedure_category_id in (14)
           and cl.xray_ind='Y'
group by rollup(claim_submission_source);

select unique cl.claim_number, trunc(cl.processed_date) as processed_date, cl.claim_submission_source
from sot22.clm_claim cl
where cl.processed_date >= sysdate - 90
           and cl.claim_submission_source='ECS'
           and cl.xray_ind='Y';
     
select count(*) from clm_document_image
where xray_ind='Y'
and scan_date >= sysdate - 90;
