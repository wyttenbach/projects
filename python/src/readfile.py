#!/usr/bin/python
import os

dict=os.path.expanduser('~/src/java/words/src/main/resources/words.txt')
dictionary=open(dict).read().splitlines()
print(dictionary[0])