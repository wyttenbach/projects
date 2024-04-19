#!/usr/bin/python
import sys

delim=','

list=open(sys.argv[1]).read().splitlines()

if len(sys.argv) > 2:
    # don't add single quotes
    print(delim.join(list))
else:
    print(delim.join("'" + item + "'" for item in list))
