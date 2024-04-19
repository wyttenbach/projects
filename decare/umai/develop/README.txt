5/19 
UMAI-34

[8:51 AM] Michal Bali
in relation to group feeder, data comes from from com.dds.adjudication.group.jpa.domain.gim.GimCustomer

[8:52 AM] Michal Bali
needs to be set to com.dds.adjudication.domain.SubgroupSnapshot excludeAi property

[8:53 AM] Michal Bali
column needs to be added to the hibernate entity class,
transformation updated - from hibernate entity to DTO (in adjudication-api): SubGroupToGroupImpl.java:472
transformation updated - from DTO to SubgroupSnapshot: ExternalGroupSnapshotToSubgroupSnapshotTransformer

