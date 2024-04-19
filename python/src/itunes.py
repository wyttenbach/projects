#!/usr/bin/env python
import glob
import subprocess
import time

src_location='/Volumes/wytten/Music/iTunes/iTunes Media/Music/*'
dest_location='/Users/wytten/Music/Music/Media.localized/Automatically Add to Music.localized'
#filenames = glob.glob(src_location)
#print(filenames)

count = 0
limit = 10
#for f in filenames:
for line in open('remote.txt').readlines():
     count += 1
     if (count > limit):
#          print(f)
          print(line)
          count = 0
          while True:
               count += 1
               dest = glob.glob(dest_location + "/*")
               if (len(dest) < 2):
                    print(dest)
                    break
               elif count > 10:
                    print(len(dest))
                    break
               else:
                    time.sleep(10)
          count = 0


#     subprocess.run(["cp", "-r", f, dest_location])
     subprocess.run(["cp", line.strip(), dest_location])

subprocess.run(["ls", "-l", dest_location])
     