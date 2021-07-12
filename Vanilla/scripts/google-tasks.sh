#!/usr/bin/env bash
export PATH="$PATH:/home/arya/.nix-profile/bin/"
emacs --script ~/.emacs.d/scripts/exercises &
emacs --script ~/.emacs.d/scripts/diet &
emacs --script ~/.emacs.d/scripts/selfcare &

wait
