# Keymap
#### Normal Mode
###### General Keymap
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-w C-w</kbd> | Jump to next window
<kbd>C-x h</kbd>   | Jump to left window
<kbd>C-x l</kbd>   | Jump to right window
<kbd>C-x j</kbd>   | Jump to below window
<kbd>C-x k</kbd>   | Jump to top window
<kbd>%</kbd>       | Go to pairing operator
<kbd>; R</kbd>     | Replace the cursor word,without confirmation,without whole word
<kbd>; r w</kbd>   | Replace the cursor word,without confirmation,with whole word
<kbd>; r c</kbd>   | Replace the cursor word,with confirmation,without whole word
<kbd>; r c w</kbd> | Replace the cursor word,with confirmation,with whole word
<kbd>; r w c</kbd> | Replace the cursor word,with confirmation,with whole word
###### Plugin 'Valloric/YouCompleteMe'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>; j d</kbd>   | `:YcmCompleter GoToDeclaration<CR>`
<kbd>; j e</kbd>   | `:YcmCompleter GoToDefinition<CR>`
###### Plugin 'nathanaelkane/vim-indent-guides'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>; i</kbd>     | Turn on or turn off Indent lines
<kbd>z a</kbd>     | Turn on or turn off cursor current code foldings
<kbd>z M</kbd>     | Turn off all code foldings
<kbd>z R</kbd>     | Turn on all code foldings
###### Plugin 'vim-scripts/a.vim'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>; c h</kbd>   | `:A<CR>` : change between *.cpp and *.h
<kbd>; s c h</kbd> | `:AS<CR>` : change between *.cpp and *.h in sub-window
###### Plugin 'dyng/ctrlsf.vim'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>; s p</kbd>   | `:CtrlSF<CR>`:search the cursor word,`q`:quit,`p`:see details
###### Plugin 'scrooloose/nerdcommenter'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>; c c</kbd>   | Comment the context
<kbd>; c u</kbd>   | Uncomment the context
###### Plugin 'vim-scripts/DrawIt'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>:DIstart</kbd>| Draw comment
<kbd>:DIstop</kbd> | Stop to draw comment
###### Plugin 'mattn/emmet-vim'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-y ,</kbd>   | Emmet-vim
###### Plugin 'scrooloose/nerdtree'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>x</kbd>   | close the tree
<kbd>X</kbd>   | close the tree(recursive)
<kbd>r</kbd>   | refresh the tree
<kbd>R</kbd>   | refresh the tree(recursive)
<kbd>p</kbd>   | jump to the parent
<kbd>P</kbd>   | jump to the parent(root)
<kbd>j(k)</kbd>   | down(up)
<kbd>K(J)</kbd>   | big down(up)
<kbd>o</kbd>   | open
<kbd>i(s)</kbd>   | split up/down(left/right)
<kbd>c</kbd>   | change to root
<kbd>q</kbd>   | close
###### Plugin 'fholgado/minibufexpl.vim'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>; f l</kbd>   | Open file list.`<CR>`:open,`r`:refresh,`I`:show or show off hidden files,`m`:show functions list
<kbd>; b l</kbd>   | `:MBEToggle<cr>`:Show on or show off buffer tabs,`s`and`v`will show both tabs
<kbd>; b n</kbd>   | `:MBEbn<cr>`:Jump to next buffer tab
<kbd>; b p</kbd>   | `:MBEbp<cr>`:Jump to previous buffer tab
###### Plugin 'sjl/gundo.vim'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>; u d</kbd>   | `:GundoToggle<CR>`:Show undo list
###### Plugin 'easymotion/vim-easymotion'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>; ; f ?</kbd> | Jump to the ? word
<kbd>; ; j(k)</kbd> | Jump to the next(below) lines
<kbd>; ; w(e)</kbd> | Jump to the words begining(end)
<kbd>; ; .</kbd> | repeat jump
<kbd>v ; ; f ?</kbd>| Select to the ? word
<kbd>d ; ; f ?</kbd>| Delete to the ? word
<kbd>y ; ; f ?</kbd>| Copy to the ? word
###### Plugin 'xuhdev/vim-latex-live-preview'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>:LLPStartPreview</kbd>| Using pdf to preview Latex
###### Plugin 'lervag/vimtex'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>] ]</kbd>| Create close envelope
###### Plugin 'terryma/vim-multiple-cursors'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-n</kbd>| several times for terryma/vim-multiple-cursors
###### Plugin 'tpope/vim-surround'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>ds</kbd>| delete a surrounding
<kbd>cs</kbd>| change a surrounding
<kbd>ys</kbd>| add a surrounding
<kbd>yS</kbd>| add a surrounding and place the surrounded text on a new line + indent it
<kbd>yss</kbd>| add a surrounding to the whole line
<kbd>ySs</kbd>| add a surrounding to the whole line, place it on a new line + indent it
<kbd>ySS</kbd>| same as ySs
###### Plugin 'MikeCoder/markdown-preview.vim'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>; m</kbd>| Markdown Preview in Github format
###### Plugin 'dyng/ctrlsf.vim'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>p</kbd>| Preview
<kbd>q</kbd>| Quit search mode
###### Plugin 'vim-ctrlspace'
Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>C-space</kbd>| show tab buffers
<kbd>j(k)</kbd>| down(up)
<kbd>return</kbd>| open file
<kbd>v(V)</kbd>| vertical split open (cursor in ctrlspace)
<kbd>s(S)</kbd>| split open (cursor in ctrlspace)
<kbd>ESC/q</kbd>| close

#### Insert Mode

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>jj</kbd>      | `<ESC>` : return to Normal Mode

# Installation
## Linux, \*nix, Mac OSX Installation
    sudo apt-get install aptitude
    sudo aptitude install exuberant-ctags ack-grep git build-essential cmake python-dev
    cd ~
    git clone https://github.com/peidong/vimrc.git
    mv vimrc .vim
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/ycm_extra_conf.py ~/.ycm_extra_conf.py
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Then vim, and :PluginInstall

    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer --omnisharp-completer --gocode-completer
    mkdir ~/.undo_history/
## Installing on Windows
Not done
