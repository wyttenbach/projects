#!/usr/bin/python3

# def multiply(a = 2, b = 3):
#     result = a * b
#     return result

# # returnedValue = multiply(2, 3)
# print(multiply())

# def printName(firstname='Dale', lastname='Evans'):
#     print(firstname.title(), lastname.title())

# printName(lastname='JONES')

def printList(*args):
    for i in args:
        print(i)

printList('JONES', 'MISTER', -1, 3.14159265, None)