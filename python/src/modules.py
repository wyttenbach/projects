#!/usr/bin/python3
from player_actions import *

player = makePlayer(name='JONES', age=29, drink='bourbon')
players=[player]

player = findPlayer('SMITH', players)
print(player)

player = findPlayer('JONES', players)
print(player)