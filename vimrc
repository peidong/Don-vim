"""""""""""""""""""""""""""""""""""""""""""""""
" Identify platform
"""""""""""""""""""""""""""""""""""""""""""""""
silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""
" Initialize variables
"""""""""""""""""""""""""""""""""""""""""""""""
let vim_function_level = 5 "1:no plugin, 2:fast and vimscripts only plugins, 3:normal and vimscripts only plugins, 4:many plugins with python support, 5:all the plugins
let system_has_ctags = 1
let vim_complete_engine = 5 "1:no auto complete, 2:VimCompletesMe, 3:neocomplcache.vim, 4:neocomplcache.vim, 5:YouCompleteMe

"""""""""""""""""""""""""""""""""""""""""""""""
" Local vimrc
"""""""""""""""""""""""""""""""""""""""""""""""
" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" Use local gvimrc if available and gui is running {
if has('gui_running')
    if filereadable(expand("~/.gvimrc.local"))
        source ~/.gvimrc.local
    endif
endif

if vim_function_level >= 2
    """""""""""""""""""""""""""""""""""""""""""""
    "                                           "
    " Neobundle 11/16/2015 added by Peidong     "
    "                                           "
    """""""""""""""""""""""""""""""""""""""""""""
    " Note: Skip initialization for vim-tiny or vim-small.
    if 0 | endif

    if has('vim_starting')
        if &compatible
            set nocompatible               " Be iMproved
        endif

        " Required:
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

    " Required:
    call neobundle#begin(expand('~/.vim/bundle/'))

    " Let NeoBundle manage NeoBundle
    " Required:
    NeoBundleFetch 'Shougo/neobundle.vim'

    " My Bundles here:

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Basic Plugins                                "
    "             11/29/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    if vim_function_level >= 3
        " Interactive command execution in Vim.
        NeoBundle 'Shougo/vimproc.vim', {
                    \ 'build' : {
                    \     'windows' : 'tools\\update-dll-mingw',
                    \     'cygwin' : 'make -f make_cygwin.mak',
                    \     'mac' : 'make',
                    \     'linux' : 'make',
                    \     'unix' : 'gmake',
                    \    },
                    \ }

        " Use shell inside vim, usage: :VimShell<CR>
        NeoBundle 'Shougo/vimshell.vim'

        " This plugin can do various things, but I only use this as a base plugin for
        " Shougo's plugins
        NeoBundle 'Shougo/unite.vim'
    endif


    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Level 2 Plugins                              "
    "             11/29/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    if vim_function_level >= 2
        " Comment code in files, usage: gcc
        NeoBundle 'tomtom/tcomment_vim'

        " Vim status line
        NeoBundle 'vim-airline/vim-airline'
        NeoBundle 'vim-airline/vim-airline-themes'

        " Auto complete pairs
        NeoBundle 'jiangmiao/auto-pairs'

        " Auto complete tags like Html tags
        NeoBundle 'docunext/closetag.vim'

        " PaperColor theme, is better for light colorscheme, also you can use it for
        " dark colorscheme
        NeoBundle 'NLKNguyen/papercolor-theme'

        " Many colorschemes, but not recommend, because some of them are not up-to-date
        " NeoBundle 'flazz/vim-colorschemes'

        " Make pairs colorful
        NeoBundle 'luochen1990/rainbow'

    endif


    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Level 3 Plugins                              "
    "             11/29/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    if vim_function_level >= 3
        " Align codes, usage: gaiw
        NeoBundle 'junegunn/vim-easy-align'

        " Check the syntastic of codes, need to install engines in PATH
        NeoBundle 'scrooloose/syntastic'

        " Show the indent lines
        NeoBundle 'Yggdroot/indentLine'

        " Show the file list, usage: :NERDTreeToggle<CR>
        NeoBundle 'scrooloose/nerdtree'

        " Embedded with NERDTree
        NeoBundle 'Xuyuanp/nerdtree-git-plugin'

        " Show the undo history, usage: :UndotreeToggle<CR>
        NeoBundle 'mbbill/undotree'

        " Fast move cursors, usage: <Leader><Leader>j/k/f/t/F/T
        NeoBundle 'easymotion/vim-easymotion'

        " Fast add/delete/change surroundings, usage: csiw/ysiw/dsiw
        NeoBundle 'tpope/vim-surround'

        " Show git status in the left column
        NeoBundle 'airblade/vim-gitgutter'

        " Do git commands inside vim, usage: :Gdiff, :Gpush, :Gpull
        NeoBundle 'tpope/vim-fugitive'

        " Show spaces in color red
        NeoBundle 'ntpeters/vim-better-whitespace'

        " Make repeat "." more smart
        NeoBundle 'tpope/vim-repeat'

        " Fast find more files, usage: <C-p>
        NeoBundle 'kien/ctrlp.vim'

        " Fast select blocks, usage: <Enter>, <Backspace>
        NeoBundle 'gcmt/wildfire.vim'

        " Make the copy function more smart, usage: when finish pasting, <Leader>p,
        " <Leader>n
        NeoBundle 'vim-scripts/YankRing.vim'

        " Change between files in buffer, usage <C-Space>
        NeoBundle 'szw/vim-ctrlspace'

        " Make vim's diff more powerful, usage: vimdiff, vim -d
        NeoBundle 'chrisbra/vim-diff-enhanced'

        " Use it in HTML codes for example, usage: <C-y>,
        NeoBundle 'mattn/emmet-vim'

        " Better folding in Python code
        NeoBundle 'tmhedberg/SimpylFold'

        " More powerful show tags generated by ctags, usage: :TagbarToggle<CR>
        if system_has_ctags == 1
            NeoBundle 'majutsushi/tagbar'
        endif

        " Useful in C code when we want to jump,
        " usage: :call CscopeFindInteractive(expand('<cword>'))<CR>
        if has('cscope')
            NeoBundle 'brookhong/cscope.vim'
        endif

        " Markdown highlight
        NeoBundle 'tpope/vim-markdown'

        " Json highlight
        NeoBundle 'elzr/vim-json'

        " Matlab highlight
        NeoBundle 'vim-scripts/MatlabFilesEdition'

        " Javascript highlight
        NeoBundle 'pangloss/vim-javascript'

        " PHP highlight
        NeoBundle 'StanAngeloff/php.vim'

        " Improved PHP omni-completion
        NeoBundle 'shawncplus/phpcomplete.vim'

        " Latex edit
        NeoBundle 'lervag/vimtex'

        " Python highlight
        if has('python')
            NeoBundle 'hdima/python-syntax'
        endif

    endif


    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Level 4 Plugins                              "
    "             11/29/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    if vim_function_level >= 4
        " Edit code with multi-cursors, usage: <C-n> next, <C-p> previous, <C-x>
        " ignore, v Normal Mode, c Change Word
        if has('Ruby')
            NeoBundle 'terryma/vim-multiple-cursors'
        endif

        " Fast find new words
        if has('Ruby')
            NeoBundle 'dyng/ctrlsf.vim'
        endif
    endif


    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Level 5 Plugins                              "
    "             11/29/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    if vim_function_level >= 5
        " Use in Mac OSX's Dash app
        " if OSX()
        "     NeoBundleLazy 'rizzatti/dash.vim'
        " endif

        " Code templates
        " if has('python')
        "     NeoBundle 'honza/vim-snippets'
        " endif

        " Preview the markdown file
        if has('python')
            NeoBundle 'MikeCoder/markdown-preview.vim'
        endif

        " Latex preview
        NeoBundle 'xuhdev/vim-latex-live-preview'

        " There are bugs in this plugin
        " NeoBundle 'SirVer/ultisnips'
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Autocomplete plugins                         "
    "             01/29/2016 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    " Auto complete engine
    if vim_complete_engine == 5
        if has('python')
            NeoBundle 'Valloric/YouCompleteMe'
        endif
    elseif vim_complete_engine == 2
        NeoBundle 'ajh17/VimCompletesMe'
    elseif vim_complete_engine == 3
        NeoBundle 'Shougo/neocomplcache.vim'
    elseif vim_complete_engine == 4
        if has('lua')
            NeoBundle 'Shougo/neocomplete.vim'
        endif
    endif


    " Refer to |:NeoBundle-examples|.
    " Note: You don't set neobundle setting in .gvimrc!

    call neobundle#end()

    " Required:
    filetype plugin indent on

    " If there are uninstalled bundles found on startup,
    " this will conveniently prompt you to install them.
    NeoBundleCheck

    " Put your non-Plugin stuff after this line
endif
""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" General settings 05/13/2015 added by Peidong "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""
" Liner number
"""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""
" Indent
"""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 自适应不同语言的智能缩进
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""
" Format
"""""""""""""""""""""""""""""""""""""""""""""""
" set nowrap                      " Do not wrap long lines
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

"""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
"""""""""""""""""""""""""""""""""""""""""""""""
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""
" Cursor line
"""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示当前行/列
set cursorline
" set cursorcolumn

"""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示搜索结果
set hlsearch
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
set smartcase                   " Case sensitive when uc present

"""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""
" 总是显示状态栏
if has('statusline')
    set laststatus=2
endif
if has('cmdline_info')
    " 显示光标当前位置
    set ruler                   " Show the ruler
    set showcmd                 " Show partial commands in status line and Selected characters/lines in visual mode
endif
" vim 自身命令行模式智能补全
set wildmenu
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

"""""""""""""""""""""""""""""""""""""""""""""""
" Tabs line
"""""""""""""""""""""""""""""""""""""""""""""""
" set tabpagemax=15               " Only show 15 tab

"""""""""""""""""""""""""""""""""""""""""""""""
" File autoread
"""""""""""""""""""""""""""""""""""""""""""""""
" 文件在Vim之外修改过，自动重新读入
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""
" Pairs auto show
"""""""""""""""""""""""""""""""""""""""""""""""
" 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch
" 100ms is 1
set matchtime=1

"""""""""""""""""""""""""""""""""""""""""""""""
" Fold
"""""""""""""""""""""""""""""""""""""""""""""""
" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" set foldenable                  " Auto fold code

"""""""""""""""""""""""""""""""""""""""""""""""
" Clipboard
"""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/svermeulen/vim-easyclip#clipboard-setting
" if has('clipboard')
"     if has('unnamedplus')  " When possible use + register for copy-paste
"         set clipboard=unnamed,unnamedplus
"     else         " On mac and Windows, use * register for copy-paste
"         set clipboard=unnamed
"     endif
" endif

"""""""""""""""""""""""""""""""""""""""""""""""
" Mouse
"""""""""""""""""""""""""""""""""""""""""""""""
" set mouse=a                 " Automatically enable mouse usage
" set mousehide               " Hide the mouse cursor while typing

"""""""""""""""""""""""""""""""""""""""""""""""
" Hidden
"""""""""""""""""""""""""""""""""""""""""""""""
set hidden "Required by Plugin vim-ctrlspace

"""""""""""""""""""""""""""""""""""""""""""""""
" Undo
"""""""""""""""""""""""""""""""""""""""""""""""
" set backup
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile " Required by Plugin mbbill/undotree
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

"""""""""""""""""""""""""""""""""""""""""""""""
" Scroll
"""""""""""""""""""""""""""""""""""""""""""""""
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor

"""""""""""""""""""""""""""""""""""""""""""""""
" List chars
"""""""""""""""""""""""""""""""""""""""""""""""
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

"""""""""""""""""""""""""""""""""""""""""""""""
" Others
"""""""""""""""""""""""""""""""""""""""""""""""
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
" set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
" set spell                           " Spell checking on
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set showmode                    " Display the current mode
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows"
set winminheight=0              " Windows can be 0 line high
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" General Keyboard Mapping                     "
"             05/13/2015 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

" inoremap jj <ESC><Right>
" 定义快捷键的前缀，即<Leader>
let mapleader="\<Space>"

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" GUI              01/28/2016 added by Peidong "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
    set guioptions-=T           " Remove the toolbar
    set lines=40                " 40 lines of text instead of 24
endif

"""""""""""""""""""""""""""""""""""""""""""""""
" Font type, size setting, and encoding.
"""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8
set encoding=utf-8
if WINDOWS()
    set fileencodings=utf-8,chinese,latin-1
    set fileencoding=chinese
    " 解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    " 解决consle输出乱码
    language messages zh_CN.utf-8
endif
if has('gui_running')
    if WINDOWS()
        set guifont=Consolas:h12   " Win32.
    elseif OSX()
        set guifont=Monaco:h12     " OSX.
    elseif LINUX()
        set guifont=Monospace\ 12  " Linux.
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""
" Color settings
"""""""""""""""""""""""""""""""""""""""""""""""
" This is for days and nights coloring
" let current_time_hour = strftime("%H")
" if current_time_hour < 18 && current_time_hour > 5
"     let vim_background="light"
" else
"     let vim_background="dark"
" endif

" This is for 50% possibility background
let current_time_second = strftime("%S")
if current_time_second % 2 == 1
    let vim_background="light"
else
    let vim_background="dark"
endif

" basic color settings
if &term == "xterm-256color"
    set t_Co=256
elseif &term == "screen-256color"
    set t_Co=256
endif
if &term == 'xterm' || &term == 'screen'
    set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif

if vim_background == "light"
    set background=light
elseif vim_background == "dark"
    set background=dark
endif

" NLKNguyen/papercolor-theme
colorscheme PaperColor

" desert
" colorscheme desert

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugins          11/18/2015 added by Peidong "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

if vim_function_level >= 2
    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin vim-airline/vim-airline               "
    "             11/16/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    if vim_background == "light"
        let g:airline_theme='sol'
    elseif vim_background == "dark"
        let g:airline_theme='dark'
    endif
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep=''
    let g:airline_right_sep=''

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin luochen1990/rainbow                   "
    "             11/17/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    let g:rainbow_active = 1

    let rainbow_ctermfgs_lightcolors = [2, 1, 0, 4]
    let rainbow_ctermfgs_darkcolors = [9, 14, 11, 13, 10, 15]
    let rainbow_guifgs_lightcolors = ['#008700', '#af005f', '#1c1c1c', '#0000af']
    let rainbow_guifgs_darkcolors = ['#f2433d', '#0087d7', '#d7af00', '#d787ff', '#00d75f', '#d0d0d0']

    if vim_background == "light"
        let g:rainbow_conf = {
                    \   'guifgs': rainbow_guifgs_lightcolors,
                    \   'ctermfgs': rainbow_ctermfgs_lightcolors
                    \}
    elseif vim_background == "dark"
        let g:rainbow_conf = {
                    \   'guifgs': rainbow_guifgs_darkcolors,
                    \   'ctermfgs': rainbow_ctermfgs_darkcolors
                    \}
    endif
endif


if vim_function_level >= 3
    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin junegunn/vim-easy-align               "
    "             01/11/2016 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin scrooloose/nerdtree                   "
    "             05/13/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    " 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
    nmap <Leader>bf :NERDTreeToggle<CR>
    " 设置NERDTree子窗口宽度
    let NERDTreeWinSize=32
    " 设置NERDTree子窗口位置
    let NERDTreeWinPos="left"
    " 显示隐藏文件
    let NERDTreeShowHidden=1
    " NERDTree 子窗口中不显示冗余帮助信息
    let NERDTreeMinimalUI=1
    " 删除文件时自动删除文件对应 buffer
    let NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeDirArrows = 1

    if has('cscope')
        """"""""""""""""""""""""""""""""""""""""""""""""
        "                                              "
        " Plugin brookhong/cscope.vim                  "
        "             01/26/2016 added by Peidong      "
        "                                              "
        """"""""""""""""""""""""""""""""""""""""""""""""

        nnoremap <leader>bc :call CscopeFindInteractive(expand('<cword>'))<CR>
        nnoremap <leader>bl :call ToggleLocationList()<CR>
        " " s: Find this C symbol
        " nnoremap  <leader>cs :call CscopeFind('s', expand('<cword>'))<CR>
        " " g: Find this definition
        " nnoremap  <leader>cg :call CscopeFind('g', expand('<cword>'))<CR>
        " " d: Find functions called by this function
        " nnoremap  <leader>cd :call CscopeFind('d', expand('<cword>'))<CR>
        " " c: Find functions calling this function
        " nnoremap  <leader>cc :call CscopeFind('c', expand('<cword>'))<CR>
        " " t: Find this text string
        " nnoremap  <leader>ct :call CscopeFind('t', expand('<cword>'))<CR>
        " " e: Find this egrep pattern
        " nnoremap  <leader>ce :call CscopeFind('e', expand('<cword>'))<CR>
        " " f: Find this file
        " nnoremap  <leader>cf :call CscopeFind('f', expand('<cword>'))<CR>
        " " i: Find files #including this file
        " nnoremap  <leader>ci :call CscopeFind('i', expand('<cword>'))<CR>
    endif

    if system_has_ctags == 1
        """"""""""""""""""""""""""""""""""""""""""""""""
        "                                              "
        " Plugin majutsushi/tagbar                     "
        "             01/26/2016 added by Peidong      "
        "                                              "
        """"""""""""""""""""""""""""""""""""""""""""""""

        nmap <Leader>bt :TagbarToggle<CR>
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin mbbill/undotree                       "
    "             11/16/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    nnoremap <Leader>bu :UndotreeToggle<cr>

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin lervag/vimtex                         "
    "             05/19/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    if vim_complete_engine == 5
        " make it work with YouCompleteMe
        if !exists('g:ycm_semantic_triggers')
            let g:ycm_semantic_triggers = {}
        endif
        let g:ycm_semantic_triggers.tex = [
                    \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
                    \ ]
        " This option controls whether to append a closing brace after a label or a citation has been completed.
        let g:vimtex_complete_close_braces = 1
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin Xuyuanp/nerdtree-git-plugin           "
    "             11/17/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "✹",
                \ "Staged"    : "✚",
                \ "Untracked" : "✭",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "✖",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✔︎",
                \ "Unknown"   : "?"
                \ }

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin vim-scripts/YankRing.vim              "
    "             11/17/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    let g:yankring_replace_n_pkey = '<Leader>p'
    let g:yankring_replace_n_nkey = '<Leader>n'

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin scrooloose/syntastic                  "
    "             05/13/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    " Better :sign interface symbols
    let g:syntastic_error_symbol = '✗✗'
    let g:syntastic_style_error_symbol = '✠✠'
    let g:syntastic_warning_symbol = '∆∆'
    let g:syntastic_style_warning_symbol = '≈≈'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_loc_list_height = 4

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin Shougo/vimshell.vim                   "
    "             11/20/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    if OSX()
        let g:vimshell_editor_command = $VIM_APP_DIR.'/MacVim.app/Contents/MacOS/Vim --servername=VIM --remote-tab-wait-silent'
    elseif LINUX()
    elseif WINDOWS()
    endif

    if executable('zsh') && filereadable(expand('~/.zsh_history'))
        " Use zsh history in vimshell/history source.
        let g:unite_source_vimshell_external_history_path =
                    \ expand('~/.zsh_history')
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin Shougo/unite.vim                      "
    "             11/21/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    let g:unite_source_history_yank_enable = 1

    if has('python')
        """"""""""""""""""""""""""""""""""""""""""""""""
        "                                              "
        " Plugin hdima/python-syntax                   "
        "             11/22/2015 added by Peidong      "
        "                                              "
        """"""""""""""""""""""""""""""""""""""""""""""""

        let python_highlight_all = 1
    endif
endif

if vim_function_level >= 4
    if has('Ruby')
        """"""""""""""""""""""""""""""""""""""""""""""""
        "                                              "
        " Plugin terryma/vim-multiple-cursors          "
        "             07/14/2015 added by Peidong      "
        "                                              "
        """"""""""""""""""""""""""""""""""""""""""""""""

        let g:multi_cursor_next_key='<C-n>'
        let g:multi_cursor_prev_key='<C-p>'
        let g:multi_cursor_skip_key='<C-x>'
        let g:multi_cursor_quit_key='<Esc>'
    endif

    if has('Ruby')
        """"""""""""""""""""""""""""""""""""""""""""""""
        "                                              "
        " Plugin dyng/ctrlsf.vim                       "
        "             05/13/2015 added by Peidong      "
        "                                              "
        """"""""""""""""""""""""""""""""""""""""""""""""

        " 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
        nnoremap <Leader>rt :CtrlSF<CR>
    endif
endif

if vim_function_level >= 5
    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin xuhdev/vim-latex-live-preview         "
    "             05/19/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    if OSX()
        let g:livepreview_previewer = 'open -a Preview'
    elseif LINUX()
        let g:livepreview_previewer = 'okular'
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    "                                              "
    " Plugin MikeCoder/markdown-preview.vim        "
    "             11/07/2015 added by Peidong      "
    "                                              "
    """"""""""""""""""""""""""""""""""""""""""""""""

    map <leader>bm :MarkdownPreview GitHub<CR>

endif

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Complete plugins 11/18/2015 added by Peidong "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

if vim_complete_engine == 5 " YouCompleteMe
    " YCM 补全菜单配色
    " 菜单
    " highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
    " 选中项
    " highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
    let g:ycm_disable_for_files_larger_than_kb = 0
    " 补全功能在注释中同样有效
    let g:ycm_complete_in_comments=1
    " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
    let g:ycm_confirm_extra_conf=0
    " 开启 YCM 标签补全引擎
    let g:ycm_collect_identifiers_from_tags_files=1
    " 引入 C++ 标准库tags
    set tags+=/data/misc/software/misc./vim/stdcpp.tags
    " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
    " inoremap <leader>; <C-x><C-o>
    " 补全内容不以分割子窗口形式出现，只显示补全列表
    set completeopt-=preview
    " 从第一个键入字符就开始罗列匹配项
    let g:ycm_min_num_of_chars_for_completion=1
    " 禁止缓存匹配项，每次都重新生成匹配项
    let g:ycm_cache_omnifunc=1
    " 语法关键字补全
    let g:ycm_seed_identifiers_with_syntax=1
    let g:ycm_filetype_blacklist = {}
    nnoremap <leader>cjd :YcmCompleter GoToDeclaration<CR>
    " 只能是 #include 或已打开的文件
    nnoremap <leader>cje :YcmCompleter GoToDefinition<CR>
    let g:ycm_error_symbol = '✗✗'
    let g:ycm_warning_symbol = '∆∆'
    "let g:ycm_show_diagnostics_ui = 0
elseif vim_complete_engine == 3 " neocomplcache
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Enable heavy features.
    " Use camel case completion.
    "let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    "let g:neocomplcache_enable_underbar_completion = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplcache#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplcache_enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplcache_enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
elseif vim_complete_engine == 4 " neocomplete
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
