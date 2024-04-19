#!/usr/bin/python3

def makePlayer(name, age, **dict):
    player={}
    player['name'] = name
    player['age'] = age
    for k, v in dict.items():
        player[k] = v
    return player

def findPlayer(name, players):
    for player in players:
        if player['name'] == name:
            return player
    return None
