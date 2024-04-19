select * 
from sot22.enr_subscriber
where 1=1
and subscriber_id=14768866
-- OPSSF 9 Feb 2023
--and first_name='LISA' and last_name='BARKSDALE'
-- OPSJD 9 Feb 2023
--and first_name='LOJI' and last_name='BGISVWOZP'
-- OPSDD 9 Feb 2023
--and first_name='GQYE' and last_name='WIXOFHRPG'
order by date_of_birth desc;

select * from
sot15.enr_subscriber
where subscriber_id=11866013
and first_name='VERONIKA';
-- sot15 not de-identified in OPSJD 9 Feb 2023

select * from
sot24.enr_subscriber
where 1=1
--subscriber_id=11866013
and first_name='GLORIA';
-- sot15 not de-identified in OPSJD 9 Feb 2023

select * from
sot24.enr_subscriber c
order by c.ins_date desc
FETCH NEXT 10 ROWS ONLY;

-- opsuu 16 Feb 2023
select * from fnd_sub_coverage_routing c
where business_segment_vc=55351
and date_of_birth='10/02/1946'
and end_date is null
and length(first_name)=6
and length(last_name)=9
order by 1 desc
FETCH NEXT 10 ROWS ONLY;
-- 50901423

-- HORIZ
select * from fnd_sub_coverage_routing c
where upper(first_name)='HIXMR'
and upper(last_name)='XQAJB';
-- empty opsdd 20 Mar 2023 

-- WLPT ClaimsInquiryUnkown
select * from fnd_sub_coverage_routing c
where 1=1
and subscriber_id=14768866
and date_of_birth='19-Feb-69'
and city='KENNETT'
and business_segment_vc=33429;
-- sub 14768866 city KENNETT opsdd 20 Mar 2023

-- HORIZ
select * from fnd_sub_coverage_routing c
where 1=1
and subscriber_id=60784768
and identifier_type_vc = 9513
and upper(first_name)='ATXMO'
and upper(last_name)='PKIMBKO';
-- opsdd 20 Mar 2023 

-- FEPBD
select * from fnd_sub_coverage_routing c
where subscriber_id=59246129
and identifier_type_vc = 9513;

and business_segment_vc=55351
and date_of_birth='09/25/1946'
and end_date is null
and length(first_name)=6
and length(last_name)=9
order by 1 desc
FETCH NEXT 10 ROWS ONLY;
-- SUBSCRIBER_ID 59246129 IDENTIFIER A76405917 opstd 15 Mar 2023
-- SUBSCRIBER_ID 59246129 IDENTIFIER W08414635 opsjd 15 Mar 2023 opsdd 20 Mar 2023

-- opsjd 28 Feb 2023
select * from fnd_sub_coverage_routing c
where business_segment_vc=33429
--and date_of_birth='09/15/1966'
--and city='SAN JOSE'
--and postal_code='95131'
and upper(first_name)='WKZ'
and upper(last_name)='HA'
--and addr1 like '8387 %'
--and identifier_type_vc = 9513
--and subscriber_id=67320173
order by date_of_birth
FETCH NEXT 100 ROWS ONLY;
-- 

-- opssf 28 Feb 2023
select * from fnd_sub_coverage_routing c
where business_segment_vc=33429
and date_of_birth='09/08/1966'
and postal_code='95131'
--and identifier_type_vc = 9513
order by date_of_birth
FETCH NEXT 100 ROWS ONLY;
-- subscriber_id=67320173

select begin_date, business_segment_vc, subscriber_id from fnd_sub_coverage_routing c
--where subscriber_id in (67110497,67320173,67575793,67249920,67279772,67287140)
where subscriber_id in (66932910,67116381,67539572,67711703,67754523,67848448,68065865,67287852,67288533)
order by 1;

select * from clm_claim_routing
where bussegment_vc= 47871
order by 1 desc
FETCH NEXT 100 ROWS ONLY;
