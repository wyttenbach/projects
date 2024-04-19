#!/usr/bin/python3

def makePlayer(name, age, **dict):
    player={}
    player['name'] = name
    player['age'] = age
    for k, v in dict.items():
        player[k] = v
    return player

player = makePlayer(name='JONES', age=29, drink='bourbon')
players=[player]

def findPlayer(name, players):
    for player in players:
        if player['name'] == name:
            return player
    return None

player = findPlayer('SMITH', players)
print(player)

player = findPlayer('JONES', players)
print(player)