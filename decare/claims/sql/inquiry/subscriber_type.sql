select subscriber_type_ind, count(nvl (subscriber_type_ind, 'x')) from clm_claim_subscriber group by subscriber_type_ind;
--update clm_claim_subscriber set   subscriber_type_ind = 'P' where subscriber_id = '7121125';
