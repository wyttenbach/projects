Dale,

Claim 73551454
•	Attached are the documents that Horizon sent to me.

From our brief conversation on the API call out in relation to the EOB
that Horizon is pulling for Issue Date: 11/08/2022 is still retaining
the patient name as Jillian when our EOB on Version 1 displays
Adelina.

Please let me know your thoughts and feedback.

Thank you,

Gina Wells, Account Management Executive
Business Development & Strategy
Mendota Heights, Minnesota 
M: (612) 201-5521 | gina.wells@decare.com
F : (888) 203-4846 
================================================================
Hi Gina,

To make a long story short, it appears that they are retrieving the
document associated with claim version 0, and that if they requested
the document associated with claim version 1, they would get the
expected result.

Note that there is more than one document associated
with claim version 0, but they are getting the REFUND record.

However since I don’t have the member portal code, I can’t tell if
this is a bug or just an operator error.  And the request/response
they sent is not the document request and so I can’t tell from that
either.






What they sent us:
-rw-r--r-- 1 AB94482 1049089 339666 Feb 28 09:36 eob.pdf



~/projects/claims/prod/claim-test ~/projects/horizon/gwells-73551454
11:20:25$ ls -ltr *.pdf
-rw-r--r-- 1 AB94482 1049089 339800 Feb 28 09:55 DRSPDF_HZEEBEXX_HORIZ_11092022_001100_32992-32994.pdf
-rw-r--r-- 1 AB94482 1049089 338988 Feb 28 09:58 DRSPDF_HZEEBEXX_HORIZ_11092022_001100_37518-37519.pdf
-rw-r--r-- 1 AB94482 1049089 341224 Feb 28 10:08 DRSPDF_HZEEBEXX_HORIZ_10192022_001042_338-340.pdf
-rw-r--r-- 1 AB94482 1049089 339666 Feb 28 10:08 DRSPDF_HZEEBEXX_HORIZ_11092022_001100_303-305.pdf
~/projects/claims/prod/claim-test ~/projects/horizon/gwells-73551454

That guy with size 339666 is a refund version 0