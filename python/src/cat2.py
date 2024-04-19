#!/usr/bin/python
import os, sys

for f in filter(os.path.isfile, sys.argv[1:]):
    for line in open(f).readlines():
        print line,
# Adding the following breaks support for multiple files
#     break
# else:
#     print sys.argv[1] + ' not found'
