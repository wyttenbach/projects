import syllables
import os, sys
import numpy as np

def printf(format, *args):
    sys.stdout.write(format % args)

five=dict()
seven=dict()

seed = np.random.randint(1, 100000)
verbose=False
if len(sys.argv) > 1:
    seed=int(sys.argv[1])
    verbose=True
np.random.seed(seed)

for line in open('steely.txt').readlines():
    line=line.rstrip('\n')
    if line.startswith("#"):
        song=line.lstrip('#')
        song=song.lstrip(' ')
        continue
    lyric=line.split('|')[0]
    count=syllables.estimate(lyric)
    if (count == 5):
        if not lyric in five:
            five[lyric] = song
    if (count == 7):
        if not lyric in seven:
            seven[lyric] = song

#printf("%s\n", five)
#printf("%s\n", seven)
#printf("%d\n", len(seven) * len(five) * len(five))
# 30600

def pick(dict):
    lyric=np.random.choice(list(dict))
    printf("%s", lyric)
    if verbose:
        song=dict[lyric]
        printf(" (%s)", song)
    print()

def haiku():
    pick(five)
    pick(seven)
    pick(five)
    printf("-%d\n", seed)

haiku()
