#!/bin/bash

#Code Against Humanity is a Fortune-like program based on Cards Against Humanity.

#Copyright (C) 2015 edkalrio
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU Affero General Public License as
#published by the Free Software Foundation, either version 3 of the
#License, or (at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#GNU Affero General Public License for more details.

#You should have received a copy of the GNU Affero General Public License
#along with this program. If not, see http://www.gnu.org/licenses/.

#Why is it written in bash? --because I'm sysadmin, not a programmer.

#Randomly reads the databases for black and white cards. A couple of wcards are 
#needed for double-tag cards. shuf is better than sort -R because it's a O(n) 
#algorithm. 
#Files are piped to /dev/fd/n and then, repiped.

read RND_B1 < <(shuf bcards.txt)
read RND_W1 < <(shuf wcards.txt)
read RND_W2 < <(shuf wcards.txt)

#Strings are matched and piped to the output.

echo -e "$RND_B1" | sed -e "s/\_/$RND_W1/; s/\_/$RND_W2/"
