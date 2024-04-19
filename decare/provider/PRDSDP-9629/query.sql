    select
        NC.ID                                                      as ID,
        nc.EFFECTIVE_FROM                                          as EFFECTIVE_FROM,
        nc.EFFECTIVE_TO                                            as EFFECTIVE_TO,
        case            
            when sysdate between nc.EFFECTIVE_FROM and nvl(nc.EFFECTIVE_TO,
            sysdate) then 'Y'            
            else 'N' 
        end                                           as NETWORK_CLINIC_STATUS,
        nc.IS_FROZEN                                               as IS_FROZEN,
        nc.FROZEN_FROM                                             as FROZEN_FROM,
        nc.PDO_OFFICE_NUMBER                                       as PDO_OFFICE_NUMBER,
        nc.CLINIC_ID                                               as CLINIC_ID,
        N.ID                                                       as NETWORK_ID,
        nvl(N.NAME,
        N.DESCRIPTION)                                 as NETWORK_NAME,
        n.PLAN_TYPE                                                as NETWORK_PLAN_TYPE,
        n.EFFECTIVE_FROM                                           as NETWORK_EFFECTIVE_FROM,
        n.EFFECTIVE_TO                                             as NETWORK_EFFECTIVE_TO,
        NDO.ID                                                     as NETWORK_DATA_OWNER_ID,
        NDO.DISPLAY_NAME                                           as NETWORK_DATA_OWNER_NAME,
        NCT.ID                                                     as NETWORK_CONTRACT_TERM_ID,
        NCT.TERMINATION_CLAUSE_LENGTH                              as NETWORK_TERMINATION_CLAUSE_LENGTH,
        NCT.EFFECTIVE_FROM                                         as NCT_EFFECTIVE_FROM,
        NCT.EFFECTIVE_TO                                           as NCT_EFFECTIVE_TO,
        NCP.ID                                                     as NCP_ID,
        NCP.PROVIDER_ID                                            as PROVIDER_ID,
        NCP.EFFECTIVE_FROM                                         as NCP_EFFECTIVE_FROM,
        NCP.EFFECTIVE_TO                                           as NCP_EFFECTIVE_TO,
        NCP.NETWORK_TYPE                                           as NETWORK_TYPE,
        cp.ID                                                      as CLINIC_PROVIDER_ID,
        cp.IN_DIRECTORY                                            as IN_DIRECTORY,
        cp.PROVIDER_RELATIONSHIP                                   as PROVIDER_RELATIONSHIP,
        CAST(provider_status.in_limbo(p.ID,
        cp.CLINIC_ID) AS CHAR) as IN_LIMBO,
        P.FIRST_NAME                                               as FIRST_NAME,
        P.MIDDLE_NAME                                              as MIDDLE_NAME,
        P.LAST_NAME                                                as LAST_NAME,
        NPI.NPI                                                    as NPI,
        PL.LICENSE_NO                                              as LICENSE_NO,
        PL.ISSUING_STATE                                           as ISSUING_STATE,
        PL.EFFECTIVE_FROM                                          as LICENSE_EFFECTIVE_FROM,
        PL.EFFECTIVE_TO                                            as LICENSE_EFFECTIVE_TO,
        PL.ON_HOLD                                                 as LICENSE_ON_HOLD,
        PL.TERMINATED                                              as LICENSE_TERMINATED,
        PL.DEA_NUMBER                                              as LICENSE_DEA_NUMBER,
        PL.DEA_NUMBER_EXPIRES                                      as LICENSE_DEA_NUMBER_EXPIRES,
        null                         as SPECIALTY_DESCRIPTION,
        null                            as SPECIALTY_CODE,
        null                                as SPECIALTY_TYPE,
        null                                                     as SPECIALTY_DATA_OWNER_ID,
        null                                           as SPECIALTY_DATA_OWNER_NAME,
        FA.ID                                                      as FEE_ASSIGNMENT_ID,
        FA.FEE_TYPE                                                as FEE_TYPE,
        FA.EFFECTIVE_FROM                                          as FEE_EFFECTIVE_FROM,
        FA.EFFECTIVE_TO                                            as FEE_EFFECTIVE_TO,
        FA.PANEL_NUMBER                                            as FEE_PANEL_NUMBER,
        FA.FEE_SCHEDULE                                            as FEE_SCHEDULE,
        FA.DATA_OWNER_ID                                           as FA_DATA_OWNER_ID,
        del.ID                                                     as DIRECTORY_EXIT_LOG_ID,
        del.EXIT_REASON_ID                                         as EXIT_REASON_ID,
        der.REASON                                                 as EXIT_REASON,
        del.EXIT_DATE                                              as EXIT_DATE,
        del.EXIT_SESSION_USER                                      as EXIT_SESSION_USER,
        del.RETURN_REASON_ID                                       as RETURN_REASON_ID,
        drr.REASON                                                 as RETURN_REASON,
        del.RETURN_DATE                                            as RETURN_DATE,
        del.RETURN_SESSION_USER                                    as RETURN_SESSION_USER 
    from
        NETWORK_CLINIC NC          
    join
        NETWORK N 
            on NC.NETWORK_ID = N.ID          
    left join
        CORE.DATA_OWNER NDO 
            ON N.DATA_OWNER_ID = NDO.ID          
    left join
        NETWORK_CLINIC_PROVIDER NCP 
            on N.ID = NCP.NETWORK_ID 
            and NC.CLINIC_ID = NCP.CLINIC_ID          
    left join
        CLINIC_PROVIDER cp 
            on cp.CLINIC_ID = ncp.CLINIC_ID 
            and cp.PROVIDER_ID = NCP.PROVIDER_ID          
    left join
        PROVIDER P 
            on NCP.PROVIDER_ID = P.ID          
    left join
        NPI_PROVIDER NP 
            on P.ID = NP.PROVIDER_ID          
    left join
        NPI NPI 
            on NP.NPI_ID = NPI.ID          
    left join
        PROVIDER_LICENSE PL 
            on PL.PROVIDER_ID = P.ID          
    left join
        FEE_ASSIGNMENT FA 
            on N.ID = FA.NETWORK_ID 
            and P.ID = FA.PROVIDER_ID 
            and FA.CLINIC_ID = cp.CLINIC_ID          
    left join
        DIRECTORY_EXIT_LOG del 
            on del.CLINIC_PROVIDER_ID = cp.ID          
    left join
        CORE.DIRECTORY_EXIT_REASONS der 
            on del.EXIT_REASON_ID = der.ID          
    left join
        CORE.DIRECTORY_RETURN_REASONS drr 
            on del.RETURN_REASON_ID = drr.ID          
    left join
        CLINIC_ADDRESS CA 
            on NC.CLINIC_ID = CA.CLINIC_ID 
            and CA.TYPE = 'D'          
    left join
        NETWORK_GRID NG 
            on CA.STATE = NG.STATE          
    left join
        NETWORK_GRID_DATA NGD 
            on N.ID = NGD.NETWORK_ID 
            and NG.ID = NGD.NETWORK_GRID_ID          
    left join
        NETWORK_CONTRACT_TERMS NCT 
            on NCT.NETWORK_CONTRACT_CODE = NGD.NETWORK_CONTRACT_CODE 
    where
        nc.CLINIC_ID = 673783;
