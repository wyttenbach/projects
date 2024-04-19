SELECT * FROM com.dds.adjudication.domain.Provider
where identifier like '%653308-645011'
or identifier like '%673861-717784'
or identifier like '%435556-722271'

Hi Kathryn, Dale,

The DOS on the claim is July 1st 2015 however the provider participates at the clinic only from July 9th 2015:
select delta_begin_date from unb_clinic_prov where clinic_no=653308 and provider_no=645011;
09-JUL-2015 00:00:00
So this is a valid behaviour.

Dale, I assume that you were searching the Gigaspaces directly. That would only work if the provider has been previously loaded into the space. I normally search the warmstart tables. 
select * from PROV_MATCHING_SNAPSHOT where identifier='UNBRANDED-653308-645011';

Michal Bali
Senior Software Developer
