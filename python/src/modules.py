#!/usr/bin/python3

def makePlayer(name, age, **dict):
    player={}
    player['name'] = name
    player['age'] = age
    return player

print(makePlayer(name='JONES', age=29))