#!/usr/bin/env python
#
# https://www.datacamp.com/community/tutorials/wordcloud-python
#
# Example line from ~/.news:
#
# Wed Aug 28 2013 - If Miley Cyrus outrages you, don't watch
#
import os, sys

from curses import wrapper
from os import path
from wordcloud import WordCloud
from matplotlib import pyplot as plt
from celluloid import Camera

plt.style.use('seaborn-pastel')
fig = plt.figure()
camera = Camera(fig)
output_file = 'news_storm.gif'

target_year = None
if len(sys.argv) > 1:
    target_year = sys.argv[1]
    output_file = 'news_storm_' + target_year + '.gif'
    
dates = []
headlines = []

count = 0
for line in open(path.expanduser('~/.news')).readlines():
    year = line[11:15]
    if target_year == None or target_year == year:
        date = line[4:15]
        dates.append(date)
        headline = line[18:]
        headlines.append(headline)
        count += 1
            
if count == 0:
    print("No match for target year ({})".format(target_year))
    sys.exit()
                
def main(stdscr):
    for frame in range(0, count):
        text = ""
        for i in range(0, frame + 1 ):
            text += headlines[i]
        stdscr.addstr(0, 0, '{} of {}:'.format(frame, count))
        stdscr.addstr(1, 0, dates[i])
        stdscr.addstr(2, 0, headlines[i])
        stdscr.refresh()
        wordcloud = WordCloud().generate(text)
        plt.axis("off")
        plt.text(0, -10, dates[frame])
        plt.imshow(wordcloud, interpolation='bilinear')
        camera.snap()

wrapper(main)

animation = camera.animate()
animation.save(output_file)

