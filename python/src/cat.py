#!/usr/bin/env python
#
# https://everythingsysadmin.com/perl2python.html
#

#
# Printing without a newline in python 2.x requires python 3 feature
#
#from __future__ import print_function
import fileinput
for line in fileinput.input():
     print (line, end="")
