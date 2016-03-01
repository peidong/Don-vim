#!/usr/bin/env bash

source base-peivim-osx-linux.sh
############################ MAIN()
variable_set "$HOME"
program_must_exist "vim"
program_must_exist "git"

do_backup       "$HOME/.vim" \
    "$HOME/.vimrc" \
    "$HOME/.gvimrc" \
    "$HOME/.vimrc.before" \
    "$HOME/.vimrc.local" \
    "$HOME/.ycm_extra_conf.py" \
    "$HOME/.vimrc.before.local"

sync_repo       "$APP_PATH" \
    "$REPO_URI" \
    "$REPO_BRANCH" \
    "$app_name"

create_symlinks "$APP_PATH" \
    "$HOME"

initialize_vim_settings "$APP_PATH" \
    "$HOME"

# setup_fork_mode "$fork_maintainer" \
#     "$APP_PATH" \
#     "$HOME"

sync_repo       "$HOME/.vim/bundle/neobundle.vim" \
    "$NEOBUNDLE_URI" \
    "master" \
    "neobundle"

setup_neobundle

if [ "$peivim_complete_engine" -eq '5' ]; then
    setup_youcompleteme "$HOME"
fi

msg             "\nThanks for installing $app_name."
msg             "© `date +%Y` https://github.com/peidong/pei-vim"
