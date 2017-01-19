"   _____                          _
"  |  __ \                        (_)
"  | |  | | ___  _ __ ________   ___ _ __ ___
"  | |  | |/ _ \| '_ \______\ \ / / | '_ ` _ \
"  | |__| | (_) | | | |      \ V /| | | | | | |
"  |_____/ \___/|_| |_|       \_/ |_|_| |_| |_|
"
""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" General settings 05/13/2015 added by Peidong "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""


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
    return (has('win32') || has('win64'))
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
"""""""""""""""""""""""""""""""""""""""""""""""
if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

"""""""""""""""""""""""""""""""""""""""""""""""
" language and encoding setup
"""""""""""""""""""""""""""""""""""""""""""""""
" always use English menu
" NOTE: this must before filetype off, otherwise it won't work
set langmenu=none

" use English for anaything in vim-editor.
if WINDOWS()
    silent exec 'language english'
elseif OSX()
    silent exec 'language en_US'
else
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        " in mac-terminal
        silent exec 'language en_US'
    else
        " in linux-terminal
        silent exec 'language en_US.utf8'
    endif
endif

" try to set encoding to utf-8
if WINDOWS()
    " Be nice and check for multi_byte even if the config requires
    " multi_byte support most of the time
    if has('multi_byte')
        " Windows cmd.exe still uses cp850. If Windows ever moved to
        " Powershell as the primary terminal, this would be utf-8
        set termencoding=cp850
        " Let Vim use utf-8 internally, because many scripts require this
        set encoding=utf-8
        setglobal fileencoding=utf-8
        " Windows has traditionally used cp1252, so it's probably wise to
        " fallback into cp1252 instead of eg. iso-8859-15.
        " Newer Windows files might contain utf-8 or utf-16 LE so we might
        " want to try them first.
        set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
    endif
else
    " set default encoding to utf-8
    set encoding=utf-8
    set termencoding=utf-8
endif
scriptencoding utf-8

"""""""""""""""""""""""""""""""""""""""""""""""
" Initialize variables in .vimrc.before.local
"""""""""""""""""""""""""""""""""""""""""""""""
" General settings
let g:donvim_setting_groups = ['set_list']

" dein.vim Plugin settings
let g:donvim_bundle_level = 5 "1:no plugin, 2:fast and vimscripts only plugins, 3:normal and vimscripts only plugins, 4:many plugins with python support, 5:all the plugins
let g:donvim_bundle_list = ['markdown', 'json', 'matlab', 'javascript', 'php', 'latex', 'python', 'writing', 'html']
let g:donvim_complete_engine = 5 "1:no auto complete, 2:VimCompletesMe, 3:neocomplcache.vim, 4:neocomplete.vim, 5:YouCompleteMe
let g:donvim_background_color_method = "hour" "hour, second, light, dark, daynight

if filereadable(expand("~/.vimrc.before.local"))
    source ~/.vimrc.before.local
endif

"""""""""""""""""""""""""""""""""""""""""""""""
" Neobundle 01/29/2016 added by Peidong
" dein.vim 01/18/2017 modified by Peidong
"""""""""""""""""""""""""""""""""""""""""""""""
"Vim 7.4 or above or NeoVim.
"git" command in $PATH (if you want to install github or vim.org plugins)
if (g:donvim_bundle_level >= 2) && (!((v:version >= 702) && executable('git')))
    let g:donvim_bundle_level = 1
endif

if g:donvim_bundle_level >= 2
    if &compatible
          set nocompatible
      endif
    set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim " path to dein.vim

    if dein#load_state(expand('~/.vim/bundle'))
        call dein#begin(expand('~/.vim/bundle')) " plugins' root path
        call dein#add('Shougo/dein.vim')

        " My Bundles here:


        """"""""""""""""""""""""""""""""""""""""""""""""
        "                                              "
        " Level 2 Plugins                              "
        "             11/29/2015 added by Peidong      "
        "                                              "
        """"""""""""""""""""""""""""""""""""""""""""""""

        if g:donvim_bundle_level >= 2


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Fast edit Plugins                            "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " Edit code with multi-cursors, usage: <C-n> next, <C-p> previous, <C-x>
            " ignore, v Normal Mode, c Change Word
            if v:version >= 704
                call dein#add('terryma/vim-multiple-cursors')
            endif

            " Comment code in files, usage: gcc
            call dein#add('tomtom/tcomment_vim')

            " Auto complete pairs
            call dein#add('jiangmiao/auto-pairs')


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Color Plugins                                "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " Many colorschemes, but not recommend, because some of them are not up-to-date
            " call dein#add('flazz/vim-colorschemes')

            " Make pairs colorful
            call dein#add('luochen1990/rainbow')

            " Vim status line
            call dein#add('vim-airline/vim-airline')
            call dein#add('vim-airline/vim-airline-themes')


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Explorer Plugins                             "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " Navigates and jumps to function definitions from the current file without ctags
            call dein#add('tacahiroy/ctrlp-funky')

        endif


        """"""""""""""""""""""""""""""""""""""""""""""""
        "                                              "
        " Level 3 Plugins                              "
        "             11/29/2015 added by Peidong      "
        "                                              "
        """"""""""""""""""""""""""""""""""""""""""""""""

        if g:donvim_bundle_level >= 3


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Color Plugins                                "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " PaperColor theme, is better for light colorscheme, also you can use it for
            " dark colorscheme
            call dein#add('NLKNguyen/papercolor-theme')


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Basic Plugins                                "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " Interactive command execution in Vim.
            call dein#add('Shougo/vimproc.vim', {
                        \ 'build' : {
                        \     'windows' : 'tools\\update-dll-mingw',
                        \     'cygwin' : 'make -f make_cygwin.mak',
                        \     'mac' : 'make -f make_mac.mak',
                        \     'linux' : 'make',
                        \     'unix' : 'gmake',
                        \    },
                        \ })

            " Use shell inside vim, usage: :VimShell<CR>
            call dein#add('Shougo/vimshell.vim')

            " This plugin can do various things, but I only use this as a base plugin for
            " Shougo's plugins
            call dein#add('Shougo/unite.vim')


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Better appearance Plugins                    "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " Show the indent lines
            if v:version >= 703 && has('conceal')
                call dein#add('Yggdroot/indentLine')
            endif

            " Show git status in the left column
            if executable('git') && !WINDOWS()
                call dein#add('airblade/vim-gitgutter')
            endif

            " Show spaces in color red
            call dein#add('ntpeters/vim-better-whitespace')

            " Make repeat "." more smart
            call dein#add('tpope/vim-repeat')

            " Make vim's diff more powerful, usage: vimdiff, vim -d
            if v:version >= 704
                call dein#add('chrisbra/vim-diff-enhanced')
            endif

            " Better folding in Python code
            call dein#add('tmhedberg/SimpylFold')


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Fast edit Plugins                            "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " Align codes, usage: gaiw
            call dein#add('junegunn/vim-easy-align')

            " Lightning fast left-right movement in Vim
            call dein#add('unblevable/quick-scope')

            " Fast add/delete/change surroundings, usage: csiw/ysiw/dsiw
            call dein#add('tpope/vim-surround')

            " Fast select blocks, usage: <Enter>, <Backspace>
            call dein#add('gcmt/wildfire.vim')

            " Improved incremental searching for Vim
            call dein#add('haya14busa/incsearch.vim')


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Explorer Plugins                             "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " Show the undo history, usage: :UndotreeToggle<CR>
            if v:version >= 700
                call dein#add('mbbill/undotree')
            endif

            " Do git commands inside vim, usage: :Gdiff, :Gpush, :Gpull
            if executable('git')
                call dein#add('tpope/vim-fugitive')
                if v:version < 702
                    call dein#add('tpope/vim-git')
                endif
            endif

            " Fast find more files, usage: <C-p>
            if v:version >= 700
                call dein#add('ctrlpvim/ctrlp.vim')
            endif

            " More powerful show tags generated by ctags, usage: :TagbarToggle<CR>
            if executable('ctags') && (v:version > 700 || (v:version == 700 && has('patch167')))
                call dein#add('majutsushi/tagbar')
            endif

            " Useful in C code when we want to jump,
            " usage: :call CscopeFindInteractive(expand('<cword>'))<CR>
            if executable('cscope')
                call dein#add('brookhong/cscope.vim')
            endif

            " Tmux integration (tmux version >= 1.5)
            if executable('tmux')
                call dein#add('benmills/vimux')
            endif


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Specific language Plugins                    "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " Markdown highlight
            if count(g:donvim_bundle_list, 'markdown')
                call dein#add('tpope/vim-markdown')
            endif

            " Json highlight
            if count(g:donvim_bundle_list, 'json') && v:version >= 703
                call dein#add('elzr/vim-json')
            endif

            " Matlab highlight
            if count(g:donvim_bundle_list, 'matlab')
                call dein#add('vim-scripts/MatlabFilesEdition')
            endif

            " Javascript highlight
            if count(g:donvim_bundle_list, 'javascript') && (v:version > 704 || (v:version == 704 && has('patch7')))
                call dein#add('pangloss/vim-javascript')
            endif

            if count(g:donvim_bundle_list, 'php')
                " PHP highlight
                call dein#add('StanAngeloff/php.vim')

                " Improved PHP omni-completion
                call dein#add('shawncplus/phpcomplete.vim')
            endif

            " Latex edit
            if count(g:donvim_bundle_list, 'latex')
                call dein#add('lervag/vimtex')
            endif

            " Python highlight
            if count(g:donvim_bundle_list, 'python')
                call dein#add('hdima/python-syntax')

                " call dein#add('ivanov/vim-ipython')
            endif

            " Writing
            if count(g:donvim_bundle_list, 'writing')
                call dein#add('reedes/vim-litecorrect')

                call dein#add('reedes/vim-textobj-sentence')

                call dein#add('reedes/vim-textobj-quote')

                call dein#add('reedes/vim-wordy')
            endif

            " Html
            if count(g:donvim_bundle_list, 'html')
                " Use it in HTML codes for example, usage: <C-y>,
                call dein#add('mattn/emmet-vim')

                " Auto complete tags like Html tags
                call dein#add('docunext/closetag.vim')
            endif

        endif


        """"""""""""""""""""""""""""""""""""""""""""""""
        "                                              "
        " Level 4 Plugins                              "
        "             11/29/2015 added by Peidong      "
        "                                              "
        """"""""""""""""""""""""""""""""""""""""""""""""

        if g:donvim_bundle_level >= 4


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Fast edit Plugins                            "
            """"""""""""""""""""""""""""""""""""""""""""""""

            " Fast find new words
            if executable('ag') || executable('ack-grep') || executable('ack')
                call dein#add('dyng/ctrlsf.vim')
            endif

            " Fast move cursors, usage: <Leader><Leader>j/k/f/t/F/T
            call dein#add('easymotion/vim-easymotion')

            " Make the copy function more smart, usage: when finish pasting, <Leader>p,
            " <Leader>n
            call dein#add('vim-scripts/YankRing.vim')


        endif


        """"""""""""""""""""""""""""""""""""""""""""""""
        "                                              "
        " Level 5 Plugins                              "
        "             11/29/2015 added by Peidong      "
        "                                              "
        """"""""""""""""""""""""""""""""""""""""""""""""

        if g:donvim_bundle_level >= 5

            " Use in Mac OSX's Dash app
            " if OSX()
                " call dein#add('rizzatti/dash.vim')
            " endif

            " Code templates
            " if has('python')
                " call dein#add('honza/vim-snippets')
            " endif


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Grammar Plugins                              "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " Check the syntastic of codes, need to install engines in PATH
            if !WINDOWS() && v:version >= 700
                call dein#add('scrooloose/syntastic')
            endif


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Explorer Plugins                             "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " Show the file list, usage: :NERDTreeToggle<CR>
            call dein#add('scrooloose/nerdtree')

            " Embedded with NERDTree
            if executable('git')
                call dein#add('Xuyuanp/nerdtree-git-plugin')
            endif

            " Change between files in buffer, usage <C-Space>
            call dein#add('szw/vim-ctrlspace')


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Preview Plugins                              "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " Preview the markdown file
            if has('python')
                if count(g:donvim_bundle_list, 'markdown')
                    call dein#add('MikeCoder/markdown-preview.vim')
                endif
            endif

            " Latex preview
            if count(g:donvim_bundle_list, 'latex') && v:version >= 703 && has('python')
                call dein#add('xuhdev/vim-latex-live-preview')
            endif

            " There are bugs in this plugin
            " call dein#add('SirVer/ultisnips')


            """"""""""""""""""""""""""""""""""""""""""""""""
            " Remote sync plugins                          "
            """"""""""""""""""""""""""""""""""""""""""""""""
            " need to create .sync file in directory
            call dein#add('eshion/vim-sync')

        endif


        """"""""""""""""""""""""""""""""""""""""""""""""
        "                                              "
        " Autocomplete plugins                         "
        "             01/29/2016 added by Peidong      "
        "                                              "
        """"""""""""""""""""""""""""""""""""""""""""""""


        if g:donvim_complete_engine == 5 && !((v:version >= 704 || (v:version ==703 && has('patch598'))) && executable('python') && has('python'))
            let g:donvim_complete_engine = 3
        endif

        if g:donvim_complete_engine == 4 && !(has('lua') && (v:version >= 704 || (v:version == 703 && has('patch885'))))
            let g:donvim_complete_engine = 3
        endif

        if g:donvim_complete_engine == 3 && has('lua') && (v:version >= 704 || (v:version == 703 && has('patch885'))) && (!WINDOWS())
            let g:donvim_complete_engine = 4
        endif

        if g:donvim_bundle_level >= 2

            " Auto complete engine
            if g:donvim_complete_engine == 5

                call dein#add('Valloric/YouCompleteMe')

            elseif g:donvim_complete_engine == 2

                call dein#add('ajh17/VimCompletesMe')

            elseif g:donvim_complete_engine == 3

                call dein#add('Shougo/neocomplcache.vim')

            elseif g:donvim_complete_engine == 4

                call dein#add('Shougo/neocomplete.vim')

            endif

        endif

        if filereadable(expand("~/.vimrc.bundles.local"))
            source ~/.vimrc.bundles.local
        endif

        call dein#end()
        call dein#save_state()
    endif

    filetype plugin indent on
    syntax enable
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
set autoindent
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
if g:donvim_bundle_level >= 2
    if has('statusline')
        set laststatus=2
    endif
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
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

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
if count(g:donvim_setting_groups, 'set_list')
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
endif

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
set lazyredraw " do not redraw while executing macros (much faster)

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
" set window size (if it's GUI)
if has('gui_running')
    if OSX()
        " set window's width to 130 columns and height to 40 rows
        if exists('+lines')
            set lines=54
        endif
        if exists('+columns')
            set columns=100
        endif
    else
        " set window's width to 130 columns and height to 40 rows
        if exists('+lines')
            set lines=40
        endif
        if exists('+columns')
            set columns=130
        endif
    endif
endif

set showfulltag " show tag with function protype.
" set guioptions+=b " present the bottom scrollbar when the longest visible line exceed the window

" disable menu & toolbar
set guioptions-=m
set guioptions-=T

"""""""""""""""""""""""""""""""""""""""""""""""
" Font
"""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
    if WINDOWS()
        set guifont=Inconsolata:h15,Consolas:h12   " Win32.
    elseif OSX()
        set guifont=Inconsolata:h15,Monaco:h12     " OSX.
    elseif LINUX()
        set guifont=Inconsolata\ 15,Monospace\ 12  " Linux.
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""
" Color settings
"""""""""""""""""""""""""""""""""""""""""""""""
if g:donvim_bundle_level >= 2

    " This is for days and nights coloring
    if g:donvim_background_color_method == "daynight"
        let current_time_hour = strftime("%H")
        if current_time_hour < 18 && current_time_hour > 5
            let g:donvim_background_color="light"
        else
            let g:donvim_background_color="dark"
        endif
    endif

    " This is for 50% possibility background
    if g:donvim_background_color_method == "second"
        let current_time_second = strftime("%S")
        if current_time_second % 2 == 1
            let g:donvim_background_color="light"
        else
            let g:donvim_background_color="dark"
        endif
    endif

    " This is for hour coloring
    if g:donvim_background_color_method == "hour"
        let current_time_hour = strftime("%H")
        if current_time_hour % 2 == 1
            let g:donvim_background_color="light"
        else
            let g:donvim_background_color="dark"
        endif
    endif

    if g:donvim_background_color_method == "light"
        let g:donvim_background_color="light"
    endif

    if g:donvim_background_color_method == "dark"
        let g:donvim_background_color="dark"
    endif

else

    let g:donvim_background_color="dark"

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

if g:donvim_background_color == "light"
    set background=light
elseif g:donvim_background_color == "dark"
    set background=dark
endif

if g:donvim_bundle_level >= 3

    " NLKNguyen/papercolor-theme
    if isdirectory(expand("~/.vim/bundle/repos/github.com/NLKNguyen/papercolor-theme"))
        colorscheme PaperColor
    endif

else

    colorscheme desert

endif


""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Plugins settings 11/18/2015 added by Peidong "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Level 2 Plugins                              "
"             01/29/2016 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""


if g:donvim_bundle_level >= 2

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin terryma/vim-multiple-cursors          "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if v:version >= 704
        if isdirectory(expand("~/.vim/bundle/repos/github.com/terryma/vim-multiple-cursors"))
            let g:multi_cursor_next_key='<C-n>'
            let g:multi_cursor_prev_key='<C-p>'
            let g:multi_cursor_skip_key='<C-x>'
            let g:multi_cursor_quit_key='<Esc>'
            " if you are using Neocomplete, add this to your vimrc to prevent
            " conflict
            if g:donvim_complete_engine == 4
                " Called once right before you start selecting multiple cursors
                function! Multiple_cursors_before()
                    if exists(':NeoCompleteLock')==2
                        exe 'NeoCompleteLock'
                    endif
                endfunction

                " Called once only when the multiple selection is canceled (default <Esc>)
                function! Multiple_cursors_after()
                    if exists(':NeoCompleteUnlock')==2
                        exe 'NeoCompleteUnlock'
                    endif
                endfunction
            endif
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin vim-airline/vim-airline               "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if isdirectory(expand("~/.vim/bundle/repos/github.com/vim-airline/vim-airline"))
        if g:donvim_background_color == "light"
            let g:airline_theme='sol'
            " let g:airline_theme='xtermlight'
        elseif g:donvim_background_color == "dark"
            " let g:airline_theme='dark'
            let g:airline_theme='kolor'
        endif
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
        let g:airline_left_sep=''
        let g:airline_right_sep=''
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin luochen1990/rainbow                   "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if isdirectory(expand("~/.vim/bundle/repos/github.com/luochen1990/rainbow"))
        let g:rainbow_active = 1

        let rainbow_ctermfgs_lightcolors = [2, 1, 0, 4]
        let rainbow_ctermfgs_darkcolors = [9, 14, 11, 13, 10, 15]
        let rainbow_guifgs_lightcolors = ['#008700', '#af005f', '#1c1c1c', '#0000af']
        let rainbow_guifgs_darkcolors = ['#f2433d', '#0087d7', '#d7af00', '#d787ff', '#00d75f', '#d0d0d0']

        if g:donvim_background_color == "light"
            let g:rainbow_conf = {
                        \   'guifgs': rainbow_guifgs_lightcolors,
                        \   'ctermfgs': rainbow_ctermfgs_lightcolors
                        \}
        elseif g:donvim_background_color == "dark"
            let g:rainbow_conf = {
                        \   'guifgs': rainbow_guifgs_darkcolors,
                        \   'ctermfgs': rainbow_ctermfgs_darkcolors
                        \}
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin tacahiroy/ctrlp-funky                 "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if isdirectory(expand("~/.vim/bundle/repos/github.com/tacahiroy/ctrlp-funky"))
        nnoremap <Leader>bp :CtrlPFunky<CR>
        " narrow the list down with a word under cursor
        nnoremap <Leader>bP :execute 'CtrlPFunky ' . expand('<cword>')<CR>
        " highlight feature
        let g:ctrlp_funky_matchtype = 'path'
        " syntax highlighting
        let g:ctrlp_funky_syntax_highlight = 1
    endif

endif


""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Level 3 Plugins                              "
"             01/29/2016 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""


if g:donvim_bundle_level >= 3

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin junegunn/vim-easy-align               "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if isdirectory(expand("~/.vim/bundle/repos/github.com/junegunn/vim-easy-align"))
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xnoremap ga <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nnoremap ga <Plug>(EasyAlign)
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin unblevable/quick-scope                "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if isdirectory(expand("~/.vim/bundle/repos/github.com/unblevable/quick-scope"))
        " Trigger a highlight in the appropriate direction when pressing these keys:
        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin brookhong/cscope.vim                  "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if executable('cscope')
        if isdirectory(expand("~/.vim/bundle/repos/github.com/brookhon/cscope.vim"))
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
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin benmills/vimux                        "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if executable('tmux')
        if isdirectory(expand("~/.vim/bundle/repos/github.com/benmills/vimux"))
            nnoremap <Leader>r :call VimuxRunCommand(getline("."))<CR>j
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin majutsushi/tagbar                     "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if executable('ctags') && (v:version > 700 || (v:version == 700 && has('patch167')))
        if isdirectory(expand("~/.vim/bundle/repos/github.com/majutsushi/tagbar"))
            nnoremap <Leader>bt :TagbarToggle<CR>
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin ctrlpvim/ctrlp.vim                    "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if v:version >= 700
        if isdirectory(expand("~/.vim/bundle/repos/github.com/ctrlpvim/ctrlp.vim"))
            " Show hidden files
            let g:ctrlp_show_hidden = 1
            let g:ctrlp_custom_ignore = {
                        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                        \ 'file': '\v\.(exe|so|dll)$',
                        \ 'link': 'some_bad_symbolic_links',
                        \ }
            " Ignore files in .gitignore
            let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin mbbill/undotree                       "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if v:version >= 700
        if isdirectory(expand("~/.vim/bundle/repos/github.com/mbbill/undotree"))
            nnoremap <Leader>bu :UndotreeToggle<CR>
            " If undotree is opened, it is likely one wants to interact with it.
            let g:undotree_SetFocusWhenToggle=1
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin lervag/vimtex                         "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if g:donvim_complete_engine == 5 && count(g:donvim_bundle_list, 'latex')
        if isdirectory(expand("~/.vim/bundle/repos/github.com/lervag/vimtex"))
            " make it work with YouCompleteMe
            if g:donvim_complete_engine == 5
                if isdirectory(expand("~/.vim/bundle/repos/github.com/Valloric/YouCompleteMe"))
                    if !exists('g:ycm_semantic_triggers')
                        let g:ycm_semantic_triggers = {}
                    endif
                    let g:ycm_semantic_triggers.tex = [
                                \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
                                \ ]
                endif
            endif
            " This option controls whether to append a closing brace after a label or a citation has been completed.
            let g:vimtex_complete_close_braces = 1
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin haya14busa/incsearch.vim              "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if isdirectory(expand("~/.vim/bundle/repos/github.com/haya14busa/incsearch.vim"))
        map /  <Plug>(incsearch-forward)
        map ?  <Plug>(incsearch-backward)
        map g/ <Plug>(incsearch-stay)
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin Shougo/vimshell.vim                   "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if isdirectory(expand("~/.vim/bundle/repos/github.com/Shougo/vimshell.vim"))
        let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
        if OSX()
            let g:vimshell_editor_command = $VIM_APP_DIR.'/MacVim.app/Contents/MacOS/Vim --servername=VIM --remote-tab-wait-silent'
            " Display user name on OSX.
            let g:vimshell_prompt = $USER."% "
            if executable('zsh') && filereadable(expand('~/.zsh_history'))
                " Use zsh history in vimshell/history source.
                let g:unite_source_vimshell_external_history_path =
                            \ expand('~/.zsh_history')
            endif
        elseif LINUX()
            " Display user name on Linux.
            let g:vimshell_prompt = $USER."% "
            if executable('zsh') && filereadable(expand('~/.zsh_history'))
                " Use zsh history in vimshell/history source.
                let g:unite_source_vimshell_external_history_path =
                            \ expand('~/.zsh_history')
            endif
        elseif WINDOWS()
            " Display user name on Windows.
            let g:vimshell_prompt = $USERNAME."% "
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin Shougo/unite.vim                      "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if isdirectory(expand("~/.vim/bundle/repos/github.com/Shougo/unite.vim"))
        let g:unite_source_history_yank_enable = 1
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin hdima/python-syntax                   "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if count(g:donvim_bundle_list, 'python')
        if isdirectory(expand("~/.vim/bundle/repos/github.com/hdima/python-syntax"))
            let python_highlight_all = 1
        endif
    endif

    " Writing
    if count(g:donvim_bundle_list, 'writing')
        """"""""""""""""""""""""""""""""""""""""""""""""
        " Plugin reedes/vim-litecorrect
        """"""""""""""""""""""""""""""""""""""""""""""""
        " augroup litecorrect
        "     autocmd!
        "     autocmd FileType markdown,mkd call litecorrect#init()
        "     autocmd FileType textile call litecorrect#init()
        "     autocmd FileType text call litecorrect#init()
        " augroup END

        """"""""""""""""""""""""""""""""""""""""""""""""
        " Plugin reedes/vim-textobj-sentence
        """"""""""""""""""""""""""""""""""""""""""""""""
        " augroup textobj_sentence
        "     autocmd!
        "     autocmd FileType markdown call textobj#sentence#init()
        "     autocmd FileType textile call textobj#sentence#init()
        "     autocmd FileType text call textobj#sentence#init()
        " augroup END

        """"""""""""""""""""""""""""""""""""""""""""""""
        " Plugin reedes/vim-textobj-quote
        """"""""""""""""""""""""""""""""""""""""""""""""
        " augroup textobj_quote
        "     autocmd!
        "     autocmd FileType markdown call textobj#quote#init()
        "     autocmd FileType textile call textobj#quote#init()
        "     autocmd FileType text call textobj#quote#init({'educate': 0})
        " augroup END
    endif


endif


""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Level 4 Plugins                              "
"             01/29/2016 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""


if g:donvim_bundle_level >= 4

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin dyng/ctrlsf.vim                       "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if executable('ag') || executable('ack-grep') || executable('ack')
        if isdirectory(expand("~/.vim/bundle/repos/github.com/dyng/ctrlsf.vim"))
            " 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
            nnoremap <Leader>rt :CtrlSF<CR>
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin vim-scripts/YankRing.vim              "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if isdirectory(expand("~/.vim/bundle/repos/github.com/vim-scripts/YankRing.vim"))
        let g:yankring_replace_n_pkey = '<Leader>p'
        let g:yankring_replace_n_nkey = '<Leader>n'
    endif

endif


""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Level 5 Plugins                              "
"             01/29/2016 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""


if g:donvim_bundle_level >= 5

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin scrooloose/syntastic                  "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if !WINDOWS() && v:version >= 700
        if isdirectory(expand("~/.vim/bundle/repos/github.com/scrooloose/syntastic"))
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
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin scrooloose/nerdtree                   "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if isdirectory(expand("~/.vim/bundle/repos/github.com/scrooloose/nerdtree"))
        " 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
        nnoremap <Leader>bf :NERDTreeToggle<CR>
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
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin Xuyuanp/nerdtree-git-plugin           "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if executable('git')
        if isdirectory(expand("~/.vim/bundle/repos/github.com/Xuyuanp/nerdtree-git-plugin"))
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
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin xuhdev/vim-latex-live-preview         "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if count(g:donvim_bundle_list, 'latex') && v:version >= 703 && has('python')
        if isdirectory(expand("~/.vim/bundle/repos/github.com/xuhdev/vim-latex-live-preview"))
            if OSX()
                let g:livepreview_previewer = 'open -a Preview'
            elseif LINUX() && executable('okular')
                let g:livepreview_previewer = 'okular'
            endif
        endif
    endif

    """"""""""""""""""""""""""""""""""""""""""""""""
    " Plugin MikeCoder/markdown-preview.vim        "
    """"""""""""""""""""""""""""""""""""""""""""""""
    if count(g:donvim_bundle_list, 'markdown')
        if isdirectory(expand("~/.vim/bundle/repos/github.com/MikeCoder/markdown-preview.vim"))
            nnoremap <leader>bm :MarkdownPreview GitHub<CR>
        endif
    endif

endif

""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Complete plugins 11/18/2015 added by Peidong "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""
if g:donvim_bundle_level >= 2

    if g:donvim_complete_engine == 5 " YouCompleteMe
        if isdirectory(expand("~/.vim/bundle/repos/github.com/Valloric/YouCompleteMe"))
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
        endif

    elseif g:donvim_complete_engine == 3 " neocomplcache

        if isdirectory(expand("~/.vim/bundle/repos/github.com/Shougo/neocomplcache"))
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
        endif

    elseif g:donvim_complete_engine == 4 " neocomplete

        if isdirectory(expand("~/.vim/bundle/repos/github.com/Shougo/neocomplete"))
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

    endif

endif


""""""""""""""""""""""""""""""""""""""""""""""""
"                                              "
" Custom settings                              "
"             01/29/2016 added by Peidong      "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""
" before.local vimrc
"""""""""""""""""""""""""""""""""""""""""""""""

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
