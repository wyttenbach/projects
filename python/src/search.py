#!/usr/bin/python
import os, re, sys

dict=os.path.expanduser('~/src/java/words/src/main/resources/words.txt')
dictionary=open(dict).read().splitlines()

def search(alist, level=0):
    index, copy, printing = level, list(alist), level+1 == len(alist)

    while 1:
        if printing:
            pattern='^' + ''.join(copy) + '$'
            for line in dictionary:
                if re.match(pattern, line):
                    print line,
        else:
            search(copy, 1+level);

        if index != 0:
            copy[index-1], copy[index] = copy[index], copy[index-1]

        index -= 1
        if index < 0:
            break


#search('dale')
search(sys.argv[1])