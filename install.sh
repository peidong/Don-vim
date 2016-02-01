#!/usr/bin/env bash
############################  SETUP PARAMETERS
app_name='pei-vim'
[ -z "$APP_PATH" ] && APP_PATH="$HOME/.vim"
[ -z "$REPO_URI" ] && REPO_URI='https://github.com/peidong/pei-vim.git'
[ -z "$REPO_BRANCH" ] && REPO_BRANCH='master'
debug_mode='0'
fork_maintainer='0'
[ -z "$NEOBUNDLE_URI" ] && NEOBUNDLE_URI="https://github.com/Shougo/neobundle.vim.git"

############################  BASIC SETUP TOOLS
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exists $1

    # throw error on non-zero return value
    if [ "$?" -ne 0 ]; then
        error "You must have '$1' installed to continue."
    fi
}

variable_set() {
    if [ -z "$1" ]; then
        error "You must have your '$1' environmental variable set to continue."
    fi
}

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    debug
}

############################ SETUP FUNCTIONS

do_backup() {
    if [ -e "$1" ] || [ -e "$2" ] || [ -e "$3" ]; then
        msg "Attempting to back up your original vim configuration."
        today=`date +%Y%m%d_%s`
        for i in "$1" "$2" "$3"; do
            [ -e "$i" ] && [ ! -L "$i" ] && mv -v "$i" "$i.$today";
        done
        ret="$?"
        success "Your original vim configuration has been backed up."
        debug
    fi
}

sync_repo() {
    local repo_path="$1"
    local repo_uri="$2"
    local repo_branch="$3"
    local repo_name="$4"

    msg "Trying to update $repo_name"

    if [ ! -e "$repo_path" ]; then
        mkdir -p "$repo_path"
        git clone -b "$repo_branch" "$repo_uri" "$repo_path"
        ret="$?"
        success "Successfully cloned $repo_name."
    else
        cd "$repo_path" && git pull origin "$repo_branch"
        ret="$?"
        success "Successfully updated $repo_name"
    fi

    debug
}

create_symlinks() {
    local source_path="$1"
    local target_path="$2"

    lnif "$source_path/vimrc"         "$target_path/.vimrc"

    if program_exists "nvim"; then
        msg "Not done for neovim"
        # lnif "$source_path/.vim"       "$target_path/.config/nvim"
        # lnif "$source_path/.vimrc"     "$target_path/.config/nvim/init.vim"
    fi

    cp "$source_path/ycm_extra_conf.py"         "$target_path/.ycm_extra_conf.py"
    cp "$source_path/tmux.conf"           "$target_path/.tmux.conf"
    cp "$source_path/vimrc.before.local"  "$target_path/.vimrc.before.local"
    touch  "$target_path/.vimrc.local"

    ret="$?"
    success "Setting up vim symlinks."
    debug
}

setup_fork_mode() {
    local source_path="$2"
    local target_path="$3"

    if [ "$1" -eq '1' ]; then
        touch "$target_path/.vimrc.fork"
        touch "$target_path/.vimrc.bundles.fork"
        touch "$target_path/.vimrc.before.fork"

        lnif "$source_path/.vimrc.fork"         "$target_path/.vimrc.fork"
        lnif "$source_path/.vimrc.bundles.fork" "$target_path/.vimrc.bundles.fork"
        lnif "$source_path/.vimrc.before.fork"  "$target_path/.vimrc.before.fork"

        ret="$?"
        success "Created fork maintainer files."
        debug
    fi
}

setup_neobundle() {
    local system_shell="$SHELL"
    export SHELL='/bin/sh'

    vim \
        "+NeoBundleInstall" \
        "+qall"

    export SHELL="$system_shell"

    success "Now updating/installing plugins using NeoBundle"
    debug
}

############################ MAIN()
variable_set "$HOME"
program_must_exist "vim"
program_must_exist "git"

do_backup       "$HOME/.vim" \
    "$HOME/.vimrc" \
    "$HOME/.gvimrc"

sync_repo       "$APP_PATH" \
    "$REPO_URI" \
    "$REPO_BRANCH" \
    "$app_name"

create_symlinks "$APP_PATH" \
    "$HOME"

# setup_fork_mode "$fork_maintainer" \
#     "$APP_PATH" \
#     "$HOME"

sync_repo       "$HOME/.vim/bundle/neobundle.vim" \
    "$NEOBUNDLE_URI" \
    "master" \
    "neobundle"

setup_neobundle
mkdir ~/.undodir/
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

msg             "\nThanks for installing $app_name."
msg             "© `date +%Y` https://github.com/peidong/pei-vim"
# if [ "$(uname)" == "Darwin"  ]; then
#     # Do something under Mac OS X platform
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux"  ]; then
#     # Do something under GNU/Linux platform
# elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT"  ]; then
#     # Do something under Windows NT platform
# fi
