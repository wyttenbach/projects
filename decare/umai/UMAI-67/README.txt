https://jira.decaresystems.ie/browse/UMAI-67

https://jira.anthem.com/browse/SDV-2941

./adjudication-core-parent/adjudication-rules/resources/application/adjudication/rules/eligibility/eligibility.drl:368: 
ruleflow-group "group"
    when
        ClaimsTransaction( bypassFlagSet == null || !bypassFlagSet.contains(BypassFlagClaim.GROUP) )
        ProcedureLine( $procedureLineUuid : uuid, procType == ProcedureLineType.PREESTIMATE )
        CategoryProcedureInfo( procedureLineUuid == $procedureLineUuid,
        	$procedureCategory : procedureCategory )
        SubgroupProcedureInfo( procedureLineUuid == $procedureLineUuid,
            subgroup.preTreatmentEstimateHoldReasonVc != null,
            subgroup.preTreatmentEstimateHoldCategory in ( $procedureCategory, HelperImpl.ALL_PROC_CATEGORY ) )
        not PolicyInstructionResult( grouping contains "Eligibility5", procedureLineUuid == $procedureLineUuid )
    then
    	insert( new StandardPolicyInstruction("Eligibility5", $procedureLineUuid) );
end

./adjudication-pu-parent/claim-director/src/test/com/dds/adjudication/service/DefaultEligibilityIntegrationTest.java:237:

./adjudication-core-parent/adjudication-rules/src/test/adjudication/rules/eligibility/DroolsEligibilityTest.java:844: 

sotxx.gim_subgroup
CLAIM_HOLD_DATE_OF_SERVICE
PRE_ESTIMATE_HOLD_REASON_VC