#!/usr/bin/python3

def makePlayer(name, age, **dict):
    player={}
    player['name'] = name
    player['age'] = age
    for k, v in dict.items():
        player[k] = v
    return player

print(makePlayer(name='JONES', age=29, drink='bourbon'))