#!/usr/bin/env python3
#
# https://www.datacamp.com/community/tutorials/wordcloud-python
#
# pip3 install wordcloud
#
# Example line from ~/.news:
#
# Wed Aug 28 2013 - If Miley Cyrus outrages you, don't watch
#
import os, sys

from os import path
from wordcloud import WordCloud

def printf(format, *args):
    sys.stdout.write(format % args)

target_year = None
if len(sys.argv) > 1:
    target_year = sys.argv[1]
    
text = ""

for line in open(path.expanduser('~/.news')).readlines():
    year = line[11:15]
    if target_year == None or target_year == year:
        headline = line[18:]
        i = headline.find(' - ')
        if i > 0:
            headline = headline[0:i]

        i = headline.find('U.S.')
        if i > 0:
            headline = headline.replace('U.S.', 'US')
            # print(headline)

        i = headline.find(' say ')
        if i > 0:
            headline = headline.replace(' say ', ' ')
            # print(headline)

        text += headline
        text += '\n'

if len(text) == 0:
    printf("No match for target year %s\n", target_year)
    sys.exit()


# Generate a word cloud image
#print(text)
wordcloud = WordCloud().generate(text)

# Display the generated image:
import matplotlib.pyplot as plt
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis("off")
plt.show()

