#!/usr/bin/env bash

############################  SETUP PARAMETERS
app_name='pei-vim'
[ -z "$APP_PATH" ] && APP_PATH="$HOME/.vim"
[ -z "$REPO_URI" ] && REPO_URI='https://github.com/peidong/pei-vim.git'
[ -z "$REPO_BRANCH" ] && REPO_BRANCH='master'
debug_mode='0'
fork_maintainer='0'
[ -z "$NEOBUNDLE_URI" ] && NEOBUNDLE_URI="https://github.com/Shougo/neobundle.vim.git"
declare -i peivim_complete_engine

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

set_vimrc_before_local() {
    program_exists $1

    # Not exist
    if [ "$?" -ne 0 ]; then
        msg "not exist '$1'"
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
    if [ -e "$1" ] || [ -e "$2" ] || [ -e "$3" ] || [ -e "$4" ] || [ -e "$5" ] || [ -e "$6" ] || [ -e "$7" ]; then
        msg "Attempting to back up your original vim configuration."
        today=`date +%Y%m%d_%s`
        for i in "$1" "$2" "$3" "$4" "$5" "$6" "$7"; do
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

    lnif "$source_path/.vimrc"         "$target_path/.vimrc"
    lnif "$source_path/.vimrc.before"         "$target_path/.vimrc.before"

    if program_exists "nvim"; then
        msg "Not done for neovim"
        # lnif "$source_path/.vim"       "$target_path/.config/nvim"
        # lnif "$source_path/.vimrc"     "$target_path/.config/nvim/init.vim"
    fi

    ret="$?"
    success "Setting up vim symlinks."
    debug
}

initialize_vim_settings() {
    local source_path="$1"
    local target_path="$2"

    cp --remove-destination "$source_path/.ycm_extra_conf.py"         "$target_path/.ycm_extra_conf.py"
    cp --remove-destination "$source_path/.tmux.conf"           "$target_path/.tmux.conf"
    touch  "$target_path/.vimrc.local"
    mkdir -p "$target_path/.undodir/"

    setup_user_local_settings "$target_path"

    ret="$?"
    success "Initialize vim settings."
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

neobundle_update() {
    local system_shell="$SHELL"
    export SHELL='/bin/sh'

    vim \
        "+NeoBundleCheckUpdate" \
        "+qall"

    export SHELL="$system_shell"

    success "Now updating/installing plugins using NeoBundle"
    debug
}

setup_user_local_settings() {
    local target_path="$1"
    local system_shell="$SHELL"
    export SHELL='/bin/sh'

    printf "\n====================================\n"
    printf "Which vim plugins level do you want?\n\n(More plugins have more functions, but also slower your vim.)\n\n1:no plugin\n2:fast and vimscripts only plugins\n3:normal and vimscripts only plugins\n4:many plugins with python support\n5:all the plugins\n"
    read -p "Please type the number:" peivim_bundle_level
    printf "\n====================================\n"
    printf "Which of the following autocomplete plugin do you want?\n\n1.No auto complete plugin\n2.VimCompletesMe\n3.neocomplcache\n4.neocomplete\n5.YouCompleteMe(preferred)\n"
    read -p "Please type the number:" peivim_complete_engine

    if [ "$peivim_bundle_level" -eq '1' ]; then
        echo "let g:peivim_bundle_level = 1" >> "$target_path/.vimrc.before.local"
    elif [ "$peivim_bundle_level" -eq '2' ]; then
        echo "let g:peivim_bundle_level = 2" >> "$target_path/.vimrc.before.local"
    elif [ "$peivim_bundle_level" -eq '3' ]; then
        echo "let g:peivim_bundle_level = 3" >> "$target_path/.vimrc.before.local"
    elif [ "$peivim_bundle_level" -eq '4' ]; then
        echo "let g:peivim_bundle_level = 4" >> "$target_path/.vimrc.before.local"
    elif [ "$peivim_bundle_level" -eq '5' ]; then
        echo "let g:peivim_bundle_level = 5" >> "$target_path/.vimrc.before.local"
    else
        echo "let g:peivim_bundle_level = 3" >> "$target_path/.vimrc.before.local"
    fi

    if [ "$peivim_complete_engine" -eq '1' ]; then
        echo "let g:peivim_complete_engine = 1" >> "$target_path/.vimrc.before.local"
    elif [ "$peivim_complete_engine" -eq '2' ]; then
        echo "let g:peivim_complete_engine = 2" >> "$target_path/.vimrc.before.local"
    elif [ "$peivim_complete_engine" -eq '3' ]; then
        echo "let g:peivim_complete_engine = 3" >> "$target_path/.vimrc.before.local"
    elif [ "$peivim_complete_engine" -eq '4' ]; then
        echo "let g:peivim_complete_engine = 4" >> "$target_path/.vimrc.before.local"
    elif [ "$peivim_complete_engine" -eq '5' ]; then
        echo "let g:peivim_complete_engine = 5" >> "$target_path/.vimrc.before.local"
    else
        echo "let g:peivim_complete_engine = 2" >> "$target_path/.vimrc.before.local"
    fi

    export SHELL="$system_shell"

    ret="$?"
    success "Finish setting .vimrc.before.local"
    debug
}

setup_youcompleteme() {
    local target_path="$1"
    local system_shell="$SHELL"
    export SHELL='/bin/sh'

    cd "$target_path/.vim/bundle/YouCompleteMe"
    ./install.py --clang-completer

    export SHELL="$system_shell"

    ret="$?"
    success "Now install YouCompleteMe"
    debug
}
