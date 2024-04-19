-- Every month when the grouprenewal GIM batch process runs there are
-- a small number (approx. 10) group contracts that fail to renew
-- properly because the contract renewal date is wrong in the
-- database.  These have to be renewed manually each month by CIM.
--
-- Kathryn suggests that we determine the scope of this problem.  I
-- think we can do that by counting those contracts in the database
-- where the renewalDate is not after the end date of the contract.
-- Once we determine how big the problem is, we can decide on further
-- action.

SELECT contract.ins_date, contract.ins_user, contract.business_segment_vc, contract.group_id, contract.end_date, contract.renewal_date
FROM fnd_gim_contract_vw contract
WHERE contract.renewal_date <= contract.end_date
AND contract.renewal_date > SYSDATE
ORDER BY contract.ins_date;

