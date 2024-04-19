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
        null as IN_LIMBO,
        null                                               as FIRST_NAME,
        null                                              as MIDDLE_NAME,
        null                                                as LAST_NAME,
        null as NPI,
        null                                              as LICENSE_NO,
        null                                           as ISSUING_STATE,
        null                                          as LICENSE_EFFECTIVE_FROM,
        null                                            as LICENSE_EFFECTIVE_TO,
        null                                                 as LICENSE_ON_HOLD,
        null                                              as LICENSE_TERMINATED,
        null                                              as LICENSE_DEA_NUMBER,
        null                                     as LICENSE_DEA_NUMBER_EXPIRES,
        null                         as SPECIALTY_DESCRIPTION,
        null                            as SPECIALTY_CODE,
        null                                as SPECIALTY_TYPE,
        null                                                     as SPECIALTY_DATA_OWNER_ID,
        null                                           as SPECIALTY_DATA_OWNER_NAME,
        null as FEE_ASSIGNMENT_ID,
        null                                                as FEE_TYPE,
        null                                          as FEE_EFFECTIVE_FROM,
        null                                            as FEE_EFFECTIVE_TO,
        null                                            as FEE_PANEL_NUMBER,
        null                                            as FEE_SCHEDULE,
        null                                           as FA_DATA_OWNER_ID,
        null as DIRECTORY_EXIT_LOG_ID,
        null                                         as EXIT_REASON_ID,
        null as EXIT_REASON,
        null                                              as EXIT_DATE,
        null                                      as EXIT_SESSION_USER,
        null                                       as RETURN_REASON_ID,
        null           as RETURN_REASON,
        null                                            as RETURN_DATE,
        null                                    as RETURN_SESSION_USER 
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
