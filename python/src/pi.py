#!/usr/bin/python
from mpmath import mp
mp.dps = 100
digits = str(mp.pi)[2:]
print(digits)
#digits.find('2013')