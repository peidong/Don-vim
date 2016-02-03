#!/usr/bin/env sh

app_dir="$HOME/.vim"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

rm $HOME/.vimrc
rm $HOME/.vimrc.before
rm $HOME/.vimrc.before.local
rm $HOME/.vimrc.local
rm $HOME/.ycm_extra_conf.py

rm -rf $app_dir
