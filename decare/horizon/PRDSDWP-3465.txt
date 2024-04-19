https://jira.anthem.com/browse/PRDSDWP-3465
BPRH Horizon API Slowness
Member Portal



# Last week
va10plvspl347.decare.com:~ > find prod/dds/ddssharedservices -name '*.out*' -mtime +5 | sort -r | head -5 | xargs horizon-mps.pl | tail -1
205 out of 22935 (0.9%) exceeded 12 seconds

# This week (as of Tuesday 8/3 10am)
va10plvspl347.decare.com:~ > find prod/dds/ddssharedservices -name '*.out*' -mtime -1 | xargs horizon-mps.pl | tail -1
22 out of 7449 (0.3%) exceeded 12 seconds


Date: Tue, 03 Aug 2021 09:59:05 -0500
Subject: Re: Horizon - Member Portal API Response Time ~ Slowness ()
From: Dale Wyttenbach <dale.wyttenbach@anthem.com>
To: "Wells, Gina A." <gina.wells@decare.com>
CC: "Gullord-Kumar, Christina" <christina.gullord-kumar@decare.com>,
	"Dixon, Janice" <janice.dixon@decare.com>

Hi Gina,

=20

I checked and the deployment has decreased the response time, as expected.

Depending on our system load, Horizon may still experience a request time o=
ut from time to time, but in general this should happen much less frequently=
.

=20

Thanks,

=20

Dale Wyttenbach

Developer Advisor, Specialty IT & Execution

Mendota Heights, MN

M: (612) 322-9894

=20
