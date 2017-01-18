#!/bin/sh

#Code Against Humanity is a Fortune-like program based on Cards Against Humanity.

#Copyright (C) 2015 edkalrio
#Copyright (C) 2015 Cards Against Humanity
#Copyright (C) 2016 Chris Hallberg
#Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International.

#Why is it written in bash? --because I'm sysadmin, not a programmer.

#Randomly reads the databases for black and white cards. A couple of wcards are 
#needed for double-tag cards. shuf is better than sort -R because it's a O(n) 
#algorithm. 

RND_B1=$(shuf bcards.txt | sed -n '1p')

shuf wcards.txt > /tmp/cah.txt

RND_W1=$(sed -n '1p' /tmp/cah.txt)
RND_W2=$(sed -n '2p' /tmp/cah.txt)
RND_W3=$(sed -n '3p' /tmp/cah.txt)

#Strings are matched and piped to the output.

echo "$RND_B1" | sed -e "s/\_/$RND_W1/; s/\_/$RND_W2/; s/\_/$RND_W3/"
