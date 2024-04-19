Provider reports that error is "No Coverages found for Member with dos
2020-01-01" regardless of the date provided.
================================================================
Testing with EligibilityServiceImplRuntimeTest
Running 'ENR_ENV=shared proj enr' to debug enrollmentsharedserviceapp

There are claims for this subscriber in OPSDD from 2020, so why is this the list of coverages:

2018-08-12 - 2018-08-12
2018-05-01 - 2018-08-11
2018-02-01 - 2018-04-30
2016-07-01 - 2018-01-31
2012-01-01 - 2016-06-30

Answer: Because that first end date is supposed to be null
It is being copied from coveredId=123389849
================================================================
Hi Dale,
Thanks for your inputs..
 
Jira PRDSDC-15630 has been raised to address this issue.
 
Thanks & Regards,
Legato Health Technologies LLP
 
Bhanu Priya R, Software Engineer
================================================================
https://jira.anthem.com/browse/PRDSDC-15630
Provider portal
September 2021

Date: Mon, 28 Jun 2021 15:32:27 -0500
Subject: Re: 5 - Warning INC10459763 has been assigned to DeCare - Dev Web
From: Dale Wyttenbach <dale.wyttenbach@anthem.com>
To: "Ansley, Kathryn" <kathryn.ansley@decare.com>

Hi Kathryn,

=20

As it turns out the code thought it was locating the subscriber covered rec=
ord already, but it was calling the wrong method.

It has been this way since the beginning: It would always return the first =
covered in the loop and so if that covered had an end date, the bug would be=
 triggered.

=20

enrollment-parent/enrollment-portal-service-impl/src/java/corporate/fs/enro=
llment/portal/service/transform/MergeCoverageToPortalCoverageTransformer.jav=
a:

                                if (coverage.getCovereds() !=3D null) {

                                               for (Object obj : coverage.g=
etCovereds()) {

                                                               Covered cove=
red =3D (Covered) obj;

-                                                               if (covered=
.getSubscriber() !=3D null) {

+                                                              if (covered.=
hasSubscriber()) {

                                                                           =
    subscriberCovered =3D covered;

                                                                           =
    break;

                                                               }

=20

Thanks,

=20

Dale Wyttenbach

Developer Advisor, Specialty IT & Execution

Mendota Heights, MN

M: (612) 322-9894

Upcoming PTO: July 6th-13th

=20
