select count(*) from anthem_jn.history;

select * from anthem_jn.history;

select entity, count(*) from anthem_jn.history group by entity order by entity;

select * from anthem_jn.history
where transaction_id='TRN-58770';

select * from anthem_jn.history
where journal_id=10950727;

select * from anthem_jn.provider
where journal_id=10950727;

select * from anthem.provider
where id in(374665,524805); -- clue? 374665 is vendor DECARE (here) and 524805 is vendor WELLPOINT (not here)




