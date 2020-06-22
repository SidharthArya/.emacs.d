#!/bin/bash
declare -A locations=(
		["Vanilla"]="$HOME/.emacs.d/"
		["Doom"]="$HOME/.doom.d/"
)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p "${locations[$Emacs]}"
for i in $(ls "$DIR/$Emacs")
do
		ln -s $REMOVE "$DIR/$Emacs/$i" "${locations[$Emacs]}"
done

