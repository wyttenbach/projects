select count(*) from anthem_jn.history;

select * from anthem_jn.history;

select entity, count(*) from anthem_jn.history group by entity order by entity;

select * from anthem_jn.history
where transaction_id='TRN-58770';

---------------------- CUSTD

select count(*) from unb.unb_provider;

select * from unb.unb_provider
where provider_no in(374665,524805); -- vendor

