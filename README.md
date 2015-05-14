# Keymap
#### Normal Mode

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>; q</kbd>     | `:q<CR>` : quit this window
<kbd>; w</kbd>     | `:w<CR>` : save this window
<kbd>; W Q</kbd>   | `:wa<CR>:q<CR>` : save all windows' contents and quit all
<kbd>; Q</kbd>     | `:qa!<CR>` : quit all without saving
<kbd>C-w C-w</kbd> | Jump to next window
<kbd>C-x h</kbd>   | Jump to left window
<kbd>C-x l</kbd>   | Jump to right window
<kbd>C-x j</kbd>   | Jump to below window
<kbd>C-x k</kbd>   | Jump to top window
<kbd>%</kbd>       | Go to pairing operator
<kbd>; j d</kbd>   | `:YcmCompleter GoToDeclaration<CR>`
<kbd>; j e</kbd>   | `:YcmCompleter GoToDefinition<CR>`
<kbd>; i</kbd>     | Turn on or turn off Indent lines
<kbd>z a</kbd>     | Turn on or turn off cursor current code foldings
<kbd>z M</kbd>     | Turn off all code foldings
<kbd>z R</kbd>     | Turn on all code foldings
<kbd>; c h</kbd>   | `:A<CR>` : change between *.cpp and *.h
<kbd>; s c h</kbd> | `:AS<CR>` : change between *.cpp and *.h in sub-window
<kbd>; s p</kbd>   | `:CtrlSF<CR>`:search the cursor word,`q`:quit,`p`:see details
<kbd>; R</kbd>     | Replace the cursor word,without confirmation,without whole word
<kbd>; r w</kbd>   | Replace the cursor word,without confirmation,with whole word
<kbd>; r c</kbd>   | Replace the cursor word,with confirmation,without whole word
<kbd>; r c w</kbd> | Replace the cursor word,with confirmation,with whole word
<kbd>; r w c</kbd> | Replace the cursor word,with confirmation,with whole word
<kbd>; c c</kbd>   | Comment the context
<kbd>; c u</kbd>   | Uncomment the context
<kbd>:DIstart</kbd>| Draw comment
<kbd>:DIstop</kbd> | Stop to draw comment
<kbd>C-y ,</kbd>   | Emmet-vim
<kbd>; f l</kbd>   | Open file list.`<CR>`:open,`r`:refresh,`I`:show or show off hidden files,`m`:show functions list
<kbd>; b l</kbd>   | `:MBEToggle<cr>`:Show on or show off buffer tabs,`s`and`v`will show both tabs
<kbd>; b n</kbd>   | `:MBEbn<cr>`:Jump to next buffer tab
<kbd>; b p</kbd>   | `:MBEbp<cr>`:Jump to previous buffer tab
<kbd>; u d</kbd>   | `:GundoToggle<CR>`:Show undo list
<kbd>; ; f ?</kbd> | Jump to the ? word
<kbd>v ; ; f ?</kbd>| Select to the ? word
<kbd>d ; ; f ?</kbd>| Delete to the ? word
<kbd>y ; ; f ?</kbd>| Copy to the ? word

#### Insert Mode

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>jj</kbd>      | `<ESC>` : return to Normal Mode

# Installation
## Linux, \*nix, Mac OSX Installation
    sudo apt-get install exuberant-ctags ack-grep git build-essential cmake python-dev
    cd ~
    git clone https://github.com/peidong/vimrc.git
    mv vimrc .vim
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/ycm_extra_conf.py ~/.ycm_extra_conf.py
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer --omnisharp-completer --gocode-completer
    mkdir ~/.undo_history/
## Installing on Windows
Not done
