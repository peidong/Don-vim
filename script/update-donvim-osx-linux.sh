#!/usr/bin/env bash

source base-donvim-osx-linux.sh
############################ MAIN()
variable_set "$HOME"
program_must_exist "vim"
program_must_exist "git"

sync_repo       "$APP_PATH" \
    "$REPO_URI" \
    "$REPO_BRANCH" \
    "$app_name"

neobundle_update

msg             "\nThanks for updating $app_name."
msg             "© `date +%Y` https://github.com/peidong/Don-vim"
