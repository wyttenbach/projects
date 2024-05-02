#!/usr/bin/python3

defaultTargets = [line.strip() for line in open("target.properties", 'r')]

# Remove values that start with '#'
print(defaultTargets)
for elem in defaultTargets:
    print(elem)
    # print(len(elem))
    # print(elem.startswith('a'))
    print(elem.startswith('#'))
    if elem.startswith("#"):
        got = defaultTargets.remove(elem)
print(got)

got = defaultTargets.pop()
print(got)

print(defaultTargets.length)