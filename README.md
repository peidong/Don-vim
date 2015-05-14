# Keymap
<leader> = ;
#### Normal Mode

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd><Leader>WQ</kbd>   | `:wa<CR>:q<CR>`
<kbd>C-+</kbd>     | Increase font size(`text-scale-increase`).
<kbd>C--</kbd>     | Decrease font size(`text-scale-decrease`).
<kbd>C-x O</kbd>   | Go back to previous window (the inverse of `other-window` (`C-x o`)).
<kbd>C-^</kbd>     | Join two lines into one(`prelude-top-join-line`).
<kbd>C-x p</kbd>   | Start `proced` (manage processes from Emacs; works only in Linux).
<kbd>C-x m</kbd>   | Start `eshell`.
<kbd>C-x M-m</kbd> | Start your default shell.
<kbd>C-x C-m</kbd> | Alias for `M-x`.
<kbd>M-X</kbd>     | Like `M-x` but limited to commands that are relevant to the active major mode.
<kbd>C-h A</kbd>   | Run `apropos` (search in all Emacs symbols).
<kbd>C-h C-m</kbd> | Display key bindings of current major mode and descriptions of every binding.
<kbd>M-/</kbd>     | Run `hippie-expand` (a replacement for the default `dabbrev-expand`).
<kbd>C-x C-b</kbd> | Open `ibuffer` (a replacement for the default `buffer-list`).
<kbd>F11</kbd>     | Make the window full screen.
<kbd>F12</kbd>     | Toggle the Emacs menu bar.
<kbd>C-x g</kbd>   | Open Magit's status buffer.
<kbd>M-Z</kbd>     | Zap up to char.
<kbd>C-=</kbd>     | Run `expand-region` (incremental text selection).
<kbd>C-a</kbd>     | Run `prelude-move-beginning-of-line`.

#### Insert Mode

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>jj</kbd>      | <ESC> : return to Normal Mode
<kbd>C-+</kbd>     | Increase font size(`text-scale-increase`).
<kbd>C--</kbd>     | Decrease font size(`text-scale-decrease`).
<kbd>C-x O</kbd>   | Go back to previous window (the inverse of `other-window` (`C-x o`)).
<kbd>C-^</kbd>     | Join two lines into one(`prelude-top-join-line`).
<kbd>C-x p</kbd>   | Start `proced` (manage processes from Emacs; works only in Linux).
<kbd>C-x m</kbd>   | Start `eshell`.
<kbd>C-x M-m</kbd> | Start your default shell.
<kbd>C-x C-m</kbd> | Alias for `M-x`.
<kbd>M-X</kbd>     | Like `M-x` but limited to commands that are relevant to the active major mode.
<kbd>C-h A</kbd>   | Run `apropos` (search in all Emacs symbols).
<kbd>C-h C-m</kbd> | Display key bindings of current major mode and descriptions of every binding.
<kbd>M-/</kbd>     | Run `hippie-expand` (a replacement for the default `dabbrev-expand`).
<kbd>C-x C-b</kbd> | Open `ibuffer` (a replacement for the default `buffer-list`).
<kbd>F11</kbd>     | Make the window full screen.
<kbd>F12</kbd>     | Toggle the Emacs menu bar.
<kbd>C-x g</kbd>   | Open Magit's status buffer.
<kbd>M-Z</kbd>     | Zap up to char.
<kbd>C-=</kbd>     | Run `expand-region` (incremental text selection).
<kbd>C-a</kbd>     | Run `prelude-move-beginning-of-line`.

# Installation
## Linux, \*nix, Mac OSX Installation
    cd ~
    git clone https://github.com/peidong/vimrc.git
    mv vimrc .vim
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/ycm_extra_conf.py ~/.ycm_extra_conf.py
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer --omnisharp-completer --gocode-completer
## Installing on Windows
Not done
# General Settings
# Plugins
Here are a few of the plugins:
## Valloric/YouCompleteMe
## mattn/emmet-vim
## Lokaltog/vim-powerline
## nathanaelkane/vim-indent-guides
## vim-scripts/a.vim
## dyng/ctrlsf.vim
## scrooloose/nerdcommenter
## vim-scripts/DrawIt
## scrooloose/nerdtree
## fholgado/minibufexpl.vim
## scrooloose/syntastic
## sjl/gundo.vim
## Lokaltog/vim-easymotion

