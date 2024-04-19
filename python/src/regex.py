#!/usr/bin/env python
import fileinput
import re
for line in fileinput.input():
     mo = re.search(r'(\d\d\d\d)-(\d{1,2})-(\d{1,2})', line)
     if mo:
          print(mo.group(1))
# Here is a date: 2020-12-16
# Test with 'regex.py regex.py'
# Should print '2020'
