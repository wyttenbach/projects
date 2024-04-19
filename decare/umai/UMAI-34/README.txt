5/19/22 UMAI-34

[8:51 AM] Michal Bali
in relation to group feeder, data comes from from com.dds.adjudication.group.jpa.domain.gim.GimCustomer

[8:52 AM] Michal Bali
needs to be set to com.dds.adjudication.domain.SubgroupSnapshot excludeAi property

[8:53 AM] Michal Bali
column needs to be added to the hibernate entity class,
transformation updated - from hibernate entity to DTO (in adjudication-api): SubGroupToGroupImpl.java:472
transformation updated - from DTO to SubgroupSnapshot: ExternalGroupSnapshotToSubgroupSnapshotTransformer

[5/24/22 12:16 PM] Michal Bali
no DB triggers for that in GIM

[5/24/22 12:16 PM] Michal Bali
here is the testing I was thinking about:

[5/24/22 12:17 PM] Michal Bali
what you can do is start gigaspace ui, from there connect to JMX on message-pu and from there we can send subgroup dynamic feeder messages (using DynamicFeederMessageSender ). Pick a group and send a message for it. Watch the log to make sure it processed fine. Then do an update in DB to set the exclude flag to Y and send another message via DynamicFeederMessageSender .

[5/24/22 12:17 PM] Michal Bali
this way you'll be able to see that no error happened in the log

[5/24/22 12:18 PM] Michal Bali
but in order to see the data actually loaded we'd need to process claim I think because the dynamic feeder message itself does not load data into space

[5/24/22 12:18 PM] Michal Bali
(I think)

[5/24/22 12:18 PM] Wyttenbach, Dale R.
okay thanks
================================================================
From: Michal Bali <mbali_contractor@8west.ie> Date: Tuesday, June 7,
2022 at 6:07 AM To: "Wyttenbach, Dale R." <dale.wyttenbach@decare.com>
Subject: RE: UMAI-34 group feeder testing with JConsole
 
Hi Dale,
 
The red line is I think saying that 1 subgroup has been added to
warmstart DB.  Not sure why in the second attempt it is not being
removed. It could be we are interpreting it incorrectly.  I think I’d
first rely on a real word test – now that the engine is deployed you
can pick a suspended claim, note its group, submit it (it should
resuspend) and as a byproduct the group should be loaded in
gigaspaces. Then in g sui look at the excludeAi indicator. Then update
it in DB. Send dynamic feeder message (can be done via updating
subgroup in GIM screen too) and then submit the claim again and note
that the excludeAi ind has been changed.
================================================================
[10:47 AM] Michal Bali
here is another way how to look at the data in warmstart: http://va33dlvxap314.decare.com:8080/adjudication-pu-monitoring-0.1-UMAI-P1-SNAPSHOT-pu/subgroup/33429/0001085217/L01309/D001/0001085217-L01309-D001/subgroupsnapshots

[10:47 AM] Michal Bali
that also shows excludeAi ind=true


