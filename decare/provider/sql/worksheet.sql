select * from anthem.provider_license
where effective_to is not null
order by effective_to desc;

select *
from ANTHEM.network_clinic_provider;

select * from anthem.network;

SELECT
        cp.PROVIDER_ID,
        cp.CLINIC_ID,
        cp.EFFECTIVE_FROM,
        cp.EFFECTIVE_TO,
        cp.IN_DIRECTORY,
        cp.PROVIDER_RELATIONSHIP,
        CASE WHEN sysdate between cp.EFFECTIVE_FROM and nvl(cp.EFFECTIVE_TO, sysdate) then 'Y' else 'N' end as ACTIVE,
        c.COMMON_NAME,
        c.EMAIL_ADDRESS,
        c.SHARED_PROPERTY,
        cpcp.DISPLAY PHONE_NUMBER,
        cpcf.DISPLAY FAX_NUMBER,
        cad.ADDRESS1,
        cad.ADDRESS2,
        cad.CITY,
        cad.STATE,
        cad.ZIP_CODE,
        ANTHEM.CLINIC_DHMO(c.ID) DHMO_PROCESSING_REQUIRED,
        CASE WHEN dc.CLINIC_ID IS NULL THEN 'N' ELSE 'Y' END DIVERSIFIED,
        w9.TIN,
        w9.IRS_NAME,
        w9.DELEGATED_CREDENTIALING,
        n.ID NETWORK_ID,
        n.NAME NETWORK_NAME,
        n.EFFECTIVE_FROM NETWORK_EFFECTIVE_FROM,
        n.EFFECTIVE_TO NETWORK_EFFECTIVE_TO,
        lg.GROUP_NAME LARGE_GROUP_NAME,
        del.ID DIRECTORY_EXIT_LOG_ID,
        del.EXIT_REASON_ID,
        der.REASON EXIT_REASON,
        del.EXIT_DATE,
        del.EXIT_SESSION_USER,
        del.RETURN_REASON_ID,
        drr.REASON RETURN_REASON,
        del.RETURN_DATE,
        del.RETURN_SESSION_USER FROM ANTHEM.CLINIC_PROVIDER cp
        LEFT OUTER JOIN ANTHEM.CLINIC c ON cp.CLINIC_ID=c.ID 
        LEFT OUTER JOIN (SELECT CLINIC_ID, MAX(NVL(EFFECTIVE_TO, SYSDATE)) CW_TO_DATE FROM ANTHEM.CLINIC_W9 cw GROUP BY CLINIC_ID) cw_date ON cp.CLINIC_ID = cw_date.CLINIC_ID 
        LEFT OUTER JOIN ANTHEM.DIVERSIFIED_CLINIC dc ON c.ID = dc.CLINIC_ID AND dc.BOUND = 'Y' AND SYSDATE BETWEEN dc.EFFECTIVE_FROM AND NVL(dc.EFFECTIVE_TO, SYSDATE)
        LEFT OUTER JOIN ANTHEM.CLINIC_W9 cw ON cp.CLINIC_ID = cw.CLINIC_ID AND cw_date.CW_TO_DATE = NVL(cw.EFFECTIVE_TO, SYSDATE) 
        LEFT OUTER JOIN ANTHEM.W9_LEGAL_ENTITY w9 ON cw.W9_ID = w9.ID 
        LEFT OUTER JOIN ANTHEM.CLINIC_PHONE_CONTACT cpcp ON c.ID = cpcp.CLINIC_ID AND cpcp."TYPE" = 'P'
        LEFT OUTER JOIN ANTHEM.CLINIC_PHONE_CONTACT cpcf ON c.ID = cpcf.CLINIC_ID AND cpcf."TYPE" = 'F'
        LEFT OUTER JOIN ANTHEM.CLINIC_ADDRESS cad ON cad.CLINIC_ID = C.ID AND cad.TYPE = 'D'
        LEFT OUTER JOIN ANTHEM.NETWORK_CLINIC_PROVIDER ncp ON ncp.CLINIC_ID = C.ID AND ncp.provider_id = cp.provider_id
        LEFT OUTER JOIN ANTHEM.NETWORK n ON ncp.NETWORK_ID = n.ID
        LEFT OUTER JOIN ANTHEM.LARGE_GROUP_TINS lg_tins ON w9.tin = lg_tins.tin
        LEFT OUTER JOIN ANTHEM.LARGE_GROUP lg ON lg_tins.large_group_id = lg.id           LEFT OUTER JOIN ANTHEM.DIRECTORY_EXIT_LOG del on del.CLINIC_PROVIDER_ID = cp.ID
        LEFT OUTER JOIN CORE.DIRECTORY_EXIT_REASONS der on del.EXIT_REASON_ID = der.ID
        LEFT OUTER JOIN CORE.DIRECTORY_RETURN_REASONS drr on del.RETURN_REASON_ID = drr.ID
    WHERE
        cp.PROVIDER_ID = :providerId;