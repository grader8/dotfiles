#!/bin/bash
#
# This script will create symlinks for all files in LINKS

LINKS="links"
DOTFILES=${PWD}

# validate script working directory is DOTFILES dir
if [ ! -f $DOTFILES/setup-symlinks.sh ]; then
  echo "*** ERROR: Make sure to run script in dotfiles dir! ***"
  exit
fi

echo "Setting up symlinks:"

# I removed the following two lines from the loop
# Refer to original if encountering errors
old_IFS="$IFS"
IFS=","
while read line; do
  if [[ ! $line == \#* ]] && [ -n "$line" ]; then
    set -- $line

    # dest - the file to override in ~/
    # src - the source file in the dotfiles repo
    dest=$(echo $1 | sed 's/^ *//g' | sed 's/ *$//g')
    dest=${dest/"~"/$HOME}
    src=$(echo $2 | sed 's/^ *//g' | sed 's/ *$//g')
    src=$DOTFILES$src

    echo "dest = "$dest
    echo "src = "$src

    # unlink
    if [ -L $dest ]; then
      unlink $dest
    fi

    # delete file
    if [ -a $dest ]; then
      rm -rf $dest
    fi

    # create dir
    mkdir -p -- "$(dirname -- "$dest")"

    # create link
    ln -sfF $src $dest
    # ln -sfF $src $dest
    echo "$src -> $dest"
  fi
done < $LINKS

IFS=$old_IFS
