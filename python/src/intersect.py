#!/usr/bin/python

# http://stackoverflow.com/questions/642763/python-intersection-of-two-lists

# direct method O(n^2)
def intersect(a, b):
     return list(set(a) & set(b))


# optimized method O(n)
def intersect2(a, b):
    s = set(b)
    return [val for val in a if val in s]

# testing
b1 = [1,2,3,4,5,9,11,15]
b2 = [4,5,6,7,8]
print(intersect(b1, b2))
print(intersect2(b1, b2))
