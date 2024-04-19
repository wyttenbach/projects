SELECT ANTHEM.PROVIDER_STATUS.PARTICIPATION_STATUS(141761),
ANTHEM.PROVIDER_STATUS.WRAPPER_PARTICIPATION_STATUS(141761)
FROM dual;

SELECT ANTHEM.PROVIDER_STATUS.all_office_del_cred(141761),
ANTHEM.PROVIDER_STATUS.all_office_diversified(141761)
FROM dual;

  SELECT COUNT(*)
    FROM network_clinic_provider ncp
    INNER JOIN provider p ON ncp.provider_id = p.id
    INNER JOIN network n ON ncp.network_id = n.id
    --most recent W9 associated to clinic
    JOIN (SELECT clinic_id, w9_id, rank() OVER (PARTITION BY clinic_id ORDER BY EFFECTIVE_TO DESC ) R FROM CLINIC_W9 cw) cw ON cw.CLINIC_ID = ncp.CLINIC_ID AND r = 1
    JOIN W9_LEGAL_ENTITY wle ON cw.W9_ID = wle.ID
  WHERE ncp.provider_id = 141761 -- specific provider
     AND n.is_participating = 'Y' -- must be a participating network
     AND (
       (
       -- network relationship ended within 179 days of now
         ncp.effective_to BETWEEN CORE.temporal.sysdatestamp - 179 AND CORE.temporal.sysdatestamp
         AND ncp.termination_level_id IS NULL -- network association never explicitly terminated
       ) OR (
         -- or network relationship explicitly marked as terminated sometime in the past
         ncp.terminated < CORE.temporal.sysdatestamp
         AND ncp.termination_level_id = 17 -- with explicit In limbo termination level
       )
     )
     AND p.effective_to IS NULL -- provider not ended
     AND p.termination_level_id IS NULL  -- provider not terminated
     --non diversified
     AND ncp.clinic_id NOT IN (SELECT CLINIC_ID FROM DIVERSIFIED_CLINIC dc WHERE dc.CLINIC_ID = ncp.clinic_id AND bound = 'Y' AND CORE.temporal.sysdatestamp BETWEEN dc.effective_from AND CORE.date_range.maximum_date(dc.effective_to))
     --non delCred
     AND wle.DELEGATED_CREDENTIALING = 'N'
     AND rownum = 1;
     
-- wrapper
  SELECT ncp.clinic_id, ncp.effective_to, ncp.termination_level_id
    FROM network_clinic_provider ncp
    INNER JOIN provider p ON ncp.provider_id = p.id
    INNER JOIN network n ON ncp.network_id = n.id
--  WHERE ncp.provider_id = 141761
    WHERE ncp.provider_id = 420429 and ncp.clinic_id=790219
     AND n.is_participating = 'Y' -- must be a participating network
     --AND (
     --  (
       -- network relationship ended within 179 days of now
      --   ncp.effective_to BETWEEN CORE.temporal.sysdatestamp - 179 AND CORE.temporal.sysdatestamp
      --   AND ncp.termination_level_id IS NULL -- network association never explicitly terminated
     --  ) OR (
         -- or network relationship explicitly marked as terminated sometime in the past
--ncp.terminated < CORE.temporal.sysdatestamp
         --AND ncp.termination_level_id = 17 -- with explicit In limbo termination level
      -- )
     --)
     AND p.effective_to IS NULL -- provider not ended
     AND p.termination_level_id IS NULL  -- provider not terminated
     --non diversified
     AND ncp.clinic_id NOT IN (SELECT CLINIC_ID FROM DIVERSIFIED_CLINIC dc WHERE dc.CLINIC_ID = ncp.clinic_id AND bound = 'Y' AND CORE.temporal.sysdatestamp BETWEEN dc.effective_from AND CORE.date_range.maximum_date(dc.effective_to))
     --clinic has w9
     AND EXISTS (select 1 FROM CLINIC_W9 cw WHERE cw.CLINIC_ID = ncp.CLINIC_ID)
     AND rownum = 1;

select * from clinic c
where id=790219;