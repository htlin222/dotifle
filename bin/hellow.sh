#! /usr/local/bin/zsh
# Program:
# This
# History 22-06-21
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
# start of my script
# IF-ELSE
# if [ -e $NAME ]
# then
#   echo "file exist"
# else
#   echo "now creat file"
#   touch "$NAME"
# fi
# CASE
read "?Are you 21? Y/N" ANSWER
case "$ANSWER" in
  [yY] | [yY][eE][sS])
    echo "You can have a beer :)"

