#!/bin/bash

# Don't link the root directory by accident if no argument passed.
if [ -z "$1" ]; then
   exit
fi

# Symlink all dotfiles into the home directory.
shopt -s dotglob
for file in $1/*; do
    if [[ "$(basename $file)" == "link.sh" ]] || [[ "$(basename $file)" == ".git" ]]; then
        continue
    fi

    echo ~/$(basename $file) "->" $file
    ln -s "$(readlink -f $file)" ~/"$(basename $file)"
done

