#!/usr/bin/python
import gzip, os, re, sys

dict=os.path.expanduser('~/src/java/words/src/main/resources/dictionary.txt.gz')
dictionary=gzip.open(dict).read().splitlines()
permutations=[]
#addregexchars=True

def perm2(letters, level=0):
    global permutations
    index, copy, printing = level, list(letters), level+1 == len(letters)

    while 1:
        if printing:
            word=''.join(copy)
            r = re.compile('^' + word + '$')
            permutations += filter(r.match, dictionary)
        else:
            perm2(copy, 1+level);

        if index != 0:
            copy[index-1], copy[index] = copy[index], copy[index-1]

        index -= 1
        if index < 0:
            break
        
def permute(letters):
    perm2(letters)
    if letters.__len__() > 2:
        for i in range(0, letters.__len__()):
            permute(letters[:i] + letters[i+1:])

def search(regex):
    r = re.compile(regex)
    return filter(r.match, dictionary)

def solve(args):
    global permutations
    if len(args) == 1 and isinstance(args[0], str):
        letters=args[0]
        permute(letters)
        return permutations
    elif len(args) == 2 and isinstance(args[1], str):
        letters=args[0]
        regex=args[1]
        permute(letters)
        r = re.compile(regex)
        return filter(r.match, permutations)
    else:
        raise TypeError('Parameter 1 is letters and optional parameter 2 is regex')


#print(search(sys.argv[1]))
#print(permute(sys.argv[1]))
print(solve(sys.argv[1:]))

