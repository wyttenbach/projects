#!/usr/bin/python
def permute(alist, level=0):
    index, copy, printing = level, list(alist), level+1 == len(alist)

    while 1:
        if printing:
            print(''.join(copy))
        else:
            permute(copy, 1+level);

        if index != 0:
            copy[index-1], copy[index] = copy[index], copy[index-1]

        index -= 1
        if index < 0:
            break


permute('dale')