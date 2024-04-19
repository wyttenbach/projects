#!/bin/bash
in=logxxx.txt
out=$in.out
grep xxx:  "$in" | cut -c 104- | tee "$out"
