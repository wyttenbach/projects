PRDSDC-15260: Dental claims are missing for below member in DECARE response
Member Portal, August 2021:

Previously the code would search for subscriber records with the given
subscriberId, and refuse to return anything if the records returned
aren’t all for the same name and DOB. Obviously the name can change
over time because of marriage or whatever, so that check has been
removed and going forward the code will only confirm that the DOB is
the same for all subscriber records returned.
